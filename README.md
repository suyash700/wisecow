# Accuknox DevOps Trainee Practical Assessment


![Uploading image.png…]()

## Overview
This repository contains the complete solution for the Accuknox DevOps Trainee Practical Assessment, covering:

1. **Containerization and Deployment** of the Wisecow Application on Kubernetes with TLS support.  
2. **System and Application Health Scripts** for monitoring and automation.  
3. **Zero-Trust KubeArmor Policy** to secure Kubernetes workloads.

---

## Problem Statement 1 — Containerization & Kubernetes Deployment

### Objective
To containerize the Wisecow application and deploy it in a Kubernetes environment with secure TLS communication and a CI/CD pipeline.

### Folder Structure
wisecow-devops-assessment/
│
├── Dockerfile
├── k8s/
│ ├── deployment.yaml
│ ├── service.yaml
│ ├── ingress.yaml
│ └── tls/
├── .github/
│ └── workflows/
│ └── ci-cd.yml
├── scripts/
│ ├── cpu.sh
│ ├── app.sh
├── kubearmor-policy.yaml
├── README.md


### Steps to Run


### Steps to Run

#### 1. Build and Push Docker Image

docker build -t <dockerhub-username>/wisecow-app:latest .
docker push <dockerhub-username>/wisecow-app:latest

2. Kubernetes Deploymentkubectl
apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

3. Access the Application

The application will be available at:
https://<your-domain-or-minikube-ip>

TLS is implemented via ingress with self-signed certificates stored in k8s/tls.

4. CI/CD Pipeline

A GitHub Actions workflow automatically:

Builds the Docker image
Pushes it to the container registry
Deploys to Kubernetes upon successful build


---------------------------------------------------------------

Problem Statement 2 — Scripts
Objective

Two scripts developed for system and application monitoring:

1. system_health.sh

Checks CPU usage, memory usage, disk space, and running processes.

Logs alerts if thresholds exceed limits.

2. app.sh

Checks application uptime by HTTP status code.

Reports if the application is up or down.

------------------------------------------------------------------

Problem Statement 3 — Zero-Trust KubeArmor Policy
Objective

Implement a zero-trust security policy for the deployed Wisecow workload using KubeArmor

Steps
Apply the policy:
kubectl apply -f kubearmor-policy.yaml

Trigger and verify policy violations.

View violation logs:
kubectl logs -n kube-system <kubearmor-pod-name>


Repository Contents

Dockerfile — Containerizes Wisecow application

k8s/ — Kubernetes manifests for deployment, service, and ingress with TLS

.github/workflows/ci-cd.yml — GitHub Actions CI/CD pipeline

scripts/ — Bash scripts 

kubearmor-policy.yaml — Zero-trust policy for Kubernetes workload

README.md — This file


Submission:

GitHub Repository Link:
https://github.com/suyash700/wisecow

Tags

#DevOps #Kubernetes #Docker #CI/CD #KubeArmor #TLS #SystemMonitoring #Accuknox
