#!/bin/bash
set -euxo pipefail

############################################################
# Cloud Native Bootstrap Script
# Installs Docker, K3s, Helm and Argo CD
############################################################

# Log everything
exec > >(tee /var/log/user-data.log | logger -t user-data)
exec 2>&1

echo "========== Starting Bootstrap =========="

############################################################
# Update package index
############################################################

apt-get update -y

############################################################
# Install packages
############################################################

apt-get install -y \
    curl \
    git \
    unzip \
    docker.io

############################################################
# Configure Docker
############################################################

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

echo "Docker installed."

############################################################
# Install K3s
############################################################

curl -sfL https://get.k3s.io | sh -

echo "Waiting for K3s..."

until [ -f /etc/rancher/k3s/k3s.yaml ]
do
    sleep 5
done

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

until kubectl cluster-info >/dev/null 2>&1
do
    sleep 5
done

echo "K3s is ready."

############################################################
# Configure kubectl for ubuntu user
############################################################

mkdir -p /home/ubuntu/.kube

cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config

chown -R ubuntu:ubuntu /home/ubuntu/.kube

chmod 600 /home/ubuntu/.kube/config

############################################################
# Install Helm
############################################################

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Helm installed."

############################################################
# Install Argo CD
############################################################

kubectl create namespace argocd \
    --dry-run=client \
    -o yaml | kubectl apply -f -

kubectl apply \
    -n argocd \
    -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Waiting for Argo CD..."

kubectl rollout status \
    deployment/argocd-server \
    -n argocd \
    --timeout=600s

kubectl wait \
    --for=condition=Ready \
    pod \
    --all \
    -n argocd \
    --timeout=600s

############################################################
# Display information
############################################################

echo ""
echo "========== Docker =========="
docker --version

echo ""
echo "========== Kubectl =========="
kubectl version --client

echo ""
echo "========== Helm =========="
helm version

echo ""
echo "========== Nodes =========="
kubectl get nodes -o wide

echo ""
echo "========== Namespaces =========="
kubectl get ns

echo ""
echo "========== Pods =========="
kubectl get pods -A

echo ""
echo "========== Services =========="
kubectl get svc -A

############################################################
# Success marker
############################################################

touch /var/log/bootstrap-complete

echo ""
echo "========== Bootstrap Completed Successfully =========="