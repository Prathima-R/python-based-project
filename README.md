# python-based-project

# Python CI/CD Pipeline using Jenkins, Docker & Webhooks

## 🚀 Overview
This project demonstrates a **real-time CI/CD pipeline** for a Python Flask web application.

Whenever new code is pushed to GitHub:
1. Jenkins automatically triggers via Webhook.
2. Builds a Docker image from Dockerfile.
3. Pushes the image to Docker Hub.
4. Deploys a running container on the server.

## 🛠️ Tools Used
- Python (Flask)
- Docker
- Jenkins
- GitHub Webhook
- Docker Hub
- Ubuntu (EC2 or local)

## ⚙️ Jenkins Pipeline Stages
1. Checkout Code  
2. Build Docker Image  
3. Login to Docker Hub  
4. Push Image  
5. Deploy Container  
6. Cleanup  

## 🌐 Webhook URL Example

