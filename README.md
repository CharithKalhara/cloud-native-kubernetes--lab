# Cloud Native Kubernetes Lab

> Production-ready cloud-native DevOps project demonstrating automated infrastructure provisioning, Kubernetes deployment, and CI/CD on AWS.

## Overview

This project provisions AWS infrastructure using Terraform, configures the server with Ansible, installs K3s, deploys a containerized Node.js application to Kubernetes, configures DNS, provisions TLS certificates, and exposes the application through NGINX Ingress. A GitHub Actions pipeline automates the entire workflow.

## Features

- One-click infrastructure provisioning
- Infrastructure as Code with Terraform
- Configuration Management with Ansible
- K3s Kubernetes cluster
- Dockerized Node.js application
- GitHub Actions CI/CD
- Docker Hub image publishing
- Route53 DNS automation
- Let's Encrypt TLS
- NGINX Ingress
- ConfigMaps & Secrets
- Persistent Volumes
- Health probes
- Resource requests & limits
- Rolling updates
- Self-healing workloads
- Prometheus & Grafana ready
- Metrics Server support

## Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
 ├──────────────┐
 ▼              ▼
Terraform   Docker Build
 │              │
 ▼              ▼
AWS EC2     Docker Hub
 │
 ▼
Ansible
 │
 ▼
K3s Kubernetes
 │
 ▼
NGINX Ingress
 │
 ▼
Let's Encrypt
 │
 ▼
https://kubernetes.charithkalhara.me
```

## Technology Stack

### Cloud
- AWS EC2
- VPC
- Route53
- IAM
- Security Groups
- Elastic IP
- S3
- DynamoDB
- CloudWatch

### Infrastructure as Code
- Terraform
- Remote State
- State Locking
- Modules
- Variables
- Outputs

### Configuration Management
- Ansible
- Playbooks
- Roles
- Inventory
- Templates

### Containers
- Docker
- Docker Hub
- Multi-stage builds

### Kubernetes
- K3s
- Deployments
- Services
- Ingress
- Namespaces
- ConfigMaps
- Secrets
- PV/PVC
- HPA
- Metrics Server
- RBAC

### CI/CD
- GitHub Actions
- Automated build
- Automated deployment
- Rolling updates

### Monitoring
- Prometheus
- Grafana
- Node Exporter
- kube-state-metrics

### Security
- GitHub Secrets
- Kubernetes Secrets
- SSH Keys
- HTTPS
- TLS
- Certbot

## Repository Structure

```text
.
├── .github/workflows/
├── terraform/
├── ansible/
├── kubernetes/
├── app/
├── screenshots/
└── README.md
```

## Deployment Workflow

1. Push code to GitHub.
2. GitHub Actions starts.
3. Terraform provisions AWS infrastructure.
4. EC2 instance is created.
5. Ansible configures the server.
6. Docker and K3s are installed.
7. Route53 DNS is updated.
8. TLS certificate is generated.
9. Docker image is built and pushed.
10. Kubernetes manifests are applied.
11. Application becomes available over HTTPS.

## Prerequisites

- AWS Account
- Docker Hub Account
- GitHub Account
- Registered Domain
- Route53 Hosted Zone

## Local Development

```bash
git clone https://github.com/CharithKalhara/cloud-native-kubernetes-lab.git
cd cloud-native-kubernetes-lab
docker build -t hello-kubernetes .
docker run -p 3000:3000 hello-kubernetes
```

## Terraform

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

## Ansible

```bash
ansible-playbook playbook.yml
```

## Kubernetes

```bash
kubectl get nodes
kubectl get pods -A
kubectl get deployments
kubectl get services
kubectl get ingress
```

## CI/CD Pipeline

- Checkout
- Terraform Init
- Terraform Apply
- Build Docker Image
- Push to Docker Hub
- Execute Ansible
- Deploy Kubernetes manifests
- Validate deployment

## Monitoring

- Prometheus
- Grafana
- Node Exporter
- Metrics Server

Suggested dashboards:
- CPU
- Memory
- Disk
- Network
- Pod Health
- Cluster Health

## Security

- IAM Least Privilege
- GitHub Secrets
- Kubernetes Secrets
- SSH Authentication
- HTTPS Everywhere
- TLS Certificates

## Future Improvements

- Helm
- Argo CD
- External Secrets Operator
- HashiCorp Vault
- Trivy
- Checkov
- Loki
- Promtail
- Alertmanager
- Velero
- AWS Load Balancer Controller
- Multi-node Kubernetes
- Service Mesh (Istio)

## Screenshots

Add:
- GitHub Actions
- Terraform Apply
- EC2
- kubectl get nodes
- kubectl get pods
- Grafana
- Prometheus
- Application

## Learning Outcomes

- Infrastructure as Code
- Kubernetes
- Cloud Networking
- DevOps Automation
- CI/CD
- Monitoring
- Cloud Security

## Author

**Charith Kalhara**

Cloud • DevOps • Kubernetes • AWS • Terraform • Ansible

GitHub: https://github.com/CharithKalhara

LinkedIn: https://www.linkedin.com/in/charithkalhara/

## License

MIT License
