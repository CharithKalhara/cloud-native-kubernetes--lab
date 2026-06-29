# 🚀 Cloud Native Kubernetes Lab

<p align="center">
<strong>A production-inspired Cloud Native Infrastructure project built with AWS, Terraform, Kubernetes, GitHub Actions, Docker and Argo CD.</strong>
</p>

## 📖 Overview

Cloud Native Kubernetes Lab demonstrates how modern cloud infrastructure can be provisioned, configured and deployed entirely as code.

The project provisions AWS infrastructure using **Terraform**, bootstraps an Ubuntu EC2 instance using **cloud-init**, installs a **K3s Kubernetes** cluster, and deploys applications using **GitHub Actions** and **Argo CD**.

---

## ✨ Features

- Infrastructure as Code using Terraform
- AWS EC2, VPC and Networking
- Terraform Remote State (Amazon S3)
- Terraform State Locking (Amazon DynamoDB)
- GitHub OIDC Authentication
- Docker
- K3s Kubernetes
- Helm
- Argo CD
- GitHub Actions CI/CD
- CloudWatch Monitoring
- Encrypted GP3 EBS Volume

## 🏗️ Solution Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
 ┌──┴───────────────┐
 │                  │
 ▼                  ▼
Terraform CI    Application CI
 │                  │
 ▼                  ▼
AWS          Docker Build & Push
 │                  │
 ▼                  ▼
Ubuntu EC2      Docker Hub
 │                  │
 ▼                  ▼
cloud-init ----> Argo CD
        │
        ▼
   K3s Kubernetes
        │
        ▼
   Hello Application
```

## 👨‍💻 Author

**Charith Kalhara**

Cloud • DevOps • AWS • Kubernetes • Terraform • Docker
