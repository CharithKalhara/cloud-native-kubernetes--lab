# Cloud Native Kubernetes Lab

A complete cloud-native deployment project that automatically provisions AWS infrastructure, configures a Kubernetes cluster, and deploys a containerized application using Infrastructure as Code (Terraform), Configuration Management (Ansible), and CI/CD (GitHub Actions).

This project demonstrates a production-style DevOps workflow where a single deployment pipeline creates the infrastructure, configures the server, installs Kubernetes, deploys the application, and exposes it through a custom domain with HTTPS.

---

# Architecture

```
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions CI/CD
    │
    ├──────────────┐
    ▼              ▼
Terraform      Docker Build
    │              │
    ▼              ▼
AWS EC2      Docker Hub
    │              │
    └──────┬───────┘
           ▼
       Ansible
           │
           ▼
     Install K3s
           │
           ▼
 Deploy Kubernetes Resources
           │
           ▼
NGINX Ingress Controller
           │
           ▼
Let's Encrypt SSL
           │
           ▼
kubernetes.charithkalhara.me
```

---

# Features

- Infrastructure as Code using Terraform
- Automatic AWS EC2 provisioning
- Automatic networking configuration
- Route53 DNS configuration
- Automatic K3s installation
- Kubernetes application deployment
- GitHub Actions CI/CD pipeline
- Docker image build and push
- NGINX Ingress Controller
- Automatic HTTPS using Let's Encrypt
- Kubernetes Secrets
- ConfigMaps
- Persistent Volumes
- Resource limits
- Health checks
- Zero manual server configuration
- One-click deployment

---

# Technologies Used

| Category | Technology |
|-----------|------------|
| Cloud | AWS EC2 |
| Infrastructure | Terraform |
| Configuration Management | Ansible |
| Container Runtime | Docker |
| Container Registry | Docker Hub |
| Orchestration | Kubernetes (K3s) |
| CI/CD | GitHub Actions |
| Reverse Proxy | NGINX Ingress |
| SSL | Certbot / Let's Encrypt |
| DNS | AWS Route53 |
| Application | Node.js |

---

# Project Structure

```
cloud-native-kubernetes-lab/

│
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── deploy.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── ec2.tf
│   ├── network.tf
│   └── route53.tf
│
├── ansible/
│   ├── inventory.ini
│   ├── playbook.yml
│   ├── roles/
│   │
│   ├── common/
│   ├── docker/
│   ├── k3s/
│   ├── ingress/
│   ├── certbot/
│   └── deploy/
│
├── kubernetes/
│   ├── namespace/
│   ├── deployment/
│   ├── service/
│   ├── ingress/
│   ├── configmap/
│   ├── secret/
│   ├── storage/
│   └── hpa/
│
├── app/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── screenshots/
│
└── README.md
```

---

# Deployment Workflow

## Step 1

Push code to GitHub.

↓

## Step 2

GitHub Actions starts automatically.

↓

## Step 3

Terraform creates:

- VPC
- Internet Gateway
- Route Table
- Security Groups
- EC2 Instance
- Elastic IP (optional)

↓

## Step 4

Terraform outputs the EC2 public IP.

↓

## Step 5

Ansible connects via SSH.

↓

## Step 6

Ansible installs:

- Docker
- K3s
- kubectl
- Helm (optional)
- NGINX Ingress

↓

## Step 7

Route53 updates DNS.

↓

## Step 8

Certbot issues SSL certificate.

↓

## Step 9

GitHub Actions builds Docker image.

↓

## Step 10

Image is pushed to Docker Hub.

↓

## Step 11

Kubernetes Deployment is updated.

↓

## Step 12

Application becomes available at:

```
https://kubernetes.charithkalhara.me
```

---

# Kubernetes Resources

This project deploys the following Kubernetes resources:

- Namespace
- Deployment
- Service
- Ingress
- ConfigMap
- Secret
- Persistent Volume
- Persistent Volume Claim
- Horizontal Pod Autoscaler (optional)

---

# CI/CD Pipeline

The CI/CD pipeline performs the following tasks automatically:

- Checkout source code
- Build Docker image
- Push image to Docker Hub
- Provision infrastructure using Terraform
- Configure server using Ansible
- Install Kubernetes
- Deploy Kubernetes manifests
- Configure DNS
- Generate SSL certificate
- Verify deployment

No manual SSH configuration is required.

---

# Application Deployment

The application is deployed as a Kubernetes Deployment with multiple replicas.

Features include:

- Rolling updates
- Zero downtime deployments
- Self-healing
- Automatic restart
- Readiness probe
- Liveness probe
- Resource requests
- Resource limits

---

# Kubernetes Components

## Deployment

Responsible for running application Pods.

Features:

- Multiple replicas
- Rolling updates
- Automatic recovery

---

## Service

Exposes Pods internally.

Service Type:

```
ClusterIP
```

---

## Ingress

Provides external access using:

```
https://kubernetes.charithkalhara.me
```

Powered by:

- NGINX Ingress Controller

---

## ConfigMap

Stores application configuration.

Example:

```
APP_NAME
APP_ENV
APP_PORT
```

---

## Secret

Stores sensitive information.

Examples:

- Database password
- API keys
- Tokens

---

## Persistent Storage

Persistent Volume

Persistent Volume Claim

Used for application data persistence.

---

# Health Checks

Liveness Probe

```yaml
httpGet:
  path: /
  port: 3000
```

Readiness Probe

```yaml
httpGet:
  path: /
  port: 3000
```

These ensure traffic is only routed to healthy Pods.

---

# Resource Management

Example configuration:

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"

  limits:
    cpu: "500m"
    memory: "512Mi"
```

---

# Security

The project follows DevOps security best practices:

- GitHub Secrets
- SSH key authentication
- Kubernetes Secrets
- HTTPS only
- TLS certificates
- Least privilege IAM permissions
- Infrastructure as Code
- Version-controlled deployments

---

# Monitoring (Optional)

Supports integration with:

- Prometheus
- Grafana
- Node Exporter
- Kubernetes Metrics Server

Possible dashboards include:

- CPU usage
- Memory usage
- Pod health
- Node health
- Network traffic
- Cluster status

---

# GitHub Secrets

Required GitHub Secrets:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION

EC2_SSH_KEY

DOCKER_USERNAME
DOCKER_PASSWORD

DOMAIN_NAME

EMAIL

TF_VAR_key_name
```

---

# Prerequisites

Before deployment, ensure you have:

- AWS Account
- Docker Hub Account
- GitHub Account
- Registered Domain
- Route53 Hosted Zone

---

# Local Development

Clone the repository

```bash
git clone https://github.com/CharithKalhara/cloud-native-kubernetes-lab.git
```

Navigate into the project

```bash
cd cloud-native-kubernetes-lab
```

Build the Docker image

```bash
docker build -t hello-kubernetes .
```

Run locally

```bash
docker run -p 3000:3000 hello-kubernetes
```

---

# Infrastructure Provisioning

Initialize Terraform

```bash
terraform init
```

Preview changes

```bash
terraform plan
```

Create infrastructure

```bash
terraform apply
```

Destroy infrastructure

```bash
terraform destroy
```

---

# Ansible Deployment

Run playbook

```bash
ansible-playbook playbook.yml
```

This installs:

- Docker
- K3s
- Ingress Controller
- SSL
- Application

---

# Kubernetes Commands

View nodes

```bash
kubectl get nodes
```

View pods

```bash
kubectl get pods -A
```

View deployments

```bash
kubectl get deployments
```

View services

```bash
kubectl get svc
```

View ingress

```bash
kubectl get ingress
```

Describe deployment

```bash
kubectl describe deployment hello-app
```

Logs

```bash
kubectl logs deployment/hello-app
```

---

# Screenshots

Include screenshots such as:

- GitHub Actions pipeline
- Terraform apply
- AWS EC2 instance
- K3s installation
- kubectl get nodes
- kubectl get pods
- kubectl get ingress
- Docker Hub image
- Route53 record
- SSL certificate
- Browser showing deployed application

---

# Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code
- Cloud Computing
- AWS
- Kubernetes
- Docker
- GitHub Actions
- Terraform
- Ansible
- Continuous Integration
- Continuous Deployment
- Cloud Networking
- DNS
- SSL Certificates
- Reverse Proxy
- DevOps Automation
- Cloud-native Application Deployment

---

# Future Improvements

- Multi-node Kubernetes cluster
- Helm charts
- Argo CD GitOps
- Cluster Autoscaler
- AWS Load Balancer Controller
- Amazon ECR
- Prometheus Operator
- Grafana dashboards
- Loki log aggregation
- Velero backups
- External Secrets Operator
- HashiCorp Vault integration
- Blue-Green deployments
- Canary deployments
- Service Mesh (Istio)
- Kubernetes Dashboard

---

# Author

**Charith Kalhara**

Computer Science Undergraduate

Cloud | DevOps | AWS | Kubernetes | Terraform | Docker | GitHub Actions

GitHub:

https://github.com/CharithKalhara

LinkedIn:

https://www.linkedin.com/in/charithkalhara/

---

# License

This project is licensed under the MIT License.
