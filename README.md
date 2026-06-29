# Cloud Native Kubernetes Lab

A cloud-native Node.js application deployed on a Kubernetes (K3s) cluster running on AWS EC2. This project demonstrates containerization, Kubernetes orchestration, CI/CD with GitHub Actions, and cloud-native deployment practices.

---

## Features

- Dockerized Node.js application
- Kubernetes (K3s) deployment
- Multiple application replicas
- Kubernetes Service (NodePort)
- Health checks (Liveness & Readiness Probes)
- Resource requests and limits
- Rolling updates
- Self-healing pods
- GitHub Actions CI/CD
- Docker Hub integration
- AWS EC2 deployment

---

## Architecture

```text
                          User
                            │
                            ▼
                    AWS EC2 Public IP
                            │
                     NodePort Service
                      Port 31908
                            │
                    Kubernetes Service
                            │
            ┌───────────────┼───────────────┐
            │               │               │
       Hello Pod 1     Hello Pod 2     Hello Pod 3
       (Node.js)       (Node.js)       (Node.js)
            │               │               │
            └───────────────┼───────────────┘
                            │
                      K3s Kubernetes
                      Single AWS EC2
```

---

## Technology Stack

- Node.js
- Docker
- Kubernetes (K3s)
- GitHub Actions
- Docker Hub
- AWS EC2
- Ubuntu Server
- YAML

---

## Project Structure

```text
cloud-native-kubernetes--lab
│
├── app/
│   ├── Dockerfile
│   ├── package.json
│   ├── server.js
│   └── public/
│
├── kubernetes/
│   ├── namespace/
│   ├── deployment/
│   ├── service/
│   └── kustomization.yaml
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
└── README.md
```

---

## Run Locally

Clone the repository

```bash
git clone https://github.com/CharithKalhara/cloud-native-kubernetes--lab.git

cd cloud-native-kubernetes--lab
```

Build the Docker image

```bash
docker build -t hello-kubernetes:1.0 ./app
```

Run the container

```bash
docker run -d -p 3000:3000 hello-kubernetes:1.0
```

Open

```
http://localhost:3000
```

---

## Deploy to Kubernetes

Create the namespace

```bash
kubectl apply -f kubernetes/namespace/
```

Deploy the application

```bash
kubectl apply -f kubernetes/
```

Check resources

```bash
kubectl get pods -n production-lab

kubectl get svc -n production-lab

kubectl get deployment -n production-lab
```

---

## Scale the Application

Increase replicas

```bash
kubectl scale deployment hello-app --replicas=5 -n production-lab
```

View pods

```bash
kubectl get pods -n production-lab
```

---

## CI/CD Workflow

Every push to the **main** branch automatically:

1. Builds the Docker image
2. Pushes the image to Docker Hub
3. Connects to the AWS EC2 instance using SSH
4. Pulls the latest source code
5. Applies Kubernetes manifests
6. Performs a rolling update
7. Verifies the deployment

---

## Kubernetes Features

- Deployments
- ReplicaSets
- Services
- Namespaces
- Rolling Updates
- Self-Healing
- Liveness Probes
- Readiness Probes
- Resource Management
- Container Orchestration

---

## Future Improvements

- Multi-node Kubernetes Cluster
- Horizontal Pod Autoscaler (HPA)
- NGINX Ingress Controller
- Prometheus Monitoring
- Grafana Dashboards
- Helm Charts
- Argo CD (GitOps)
- Amazon EKS Deployment
- Multi-cloud Kubernetes
- HTTPS with Let's Encrypt

---

## Learning Outcomes

This project demonstrates practical experience with:

- Cloud-native application deployment
- Docker containerization
- Kubernetes orchestration
- CI/CD automation
- AWS cloud infrastructure
- Infrastructure as Code
- Production deployment workflows

---

## Author

**Charith Kalhara**
