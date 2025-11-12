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


🧩 1. Prerequisites
Install these on your Jenkins EC2

🧩 2. Setup Jenkins Access
Open Jenkins in browser → http://<your-ip>:8080
Unlock Jenkins → install Suggested Plugins
Create Admin user
Install plugins:
Git Plugin
Docker Plugin
Pipeline Plugin
GitHub Integration Plugin

🧩 3. Setup Docker Credentials in Jenkins

Go to Manage Jenkins → Credentials → System → Global → Add Credentials
Kind = Username and Password
ID = dockerhub
Username = your Docker Hub username
Password = your Docker Hub password / token

🧩 5. Create Jenkins Pipeline

Go to Jenkins Dashboard → New Item → Pipeline
Name: Python-Docker-Pipeline
Choose “Pipeline”
Under Pipeline script from SCM → Git
Enter your GitHub Repo URL
Branch = main
Script Path = Jenkinsfile
Save → Build Now ✅

🧩 6. Setup Webhook (Automation from GitHub)
Go to your GitHub repo → Settings → Webhooks → Add Webhook
Payload URL = http://<jenkins-server-ip>:8080/github-webhook/
Content type = application/json
Trigger = “Just the push event”
Save webhook

