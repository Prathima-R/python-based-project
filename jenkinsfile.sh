pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '📥 Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t mypythonapp:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo '🔐 Logging in to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                echo '🚀 Pushing image to Docker Hub...'
                sh '''
                    docker tag mypythonapp:latest prathima2025/mypythonapp:latest
                    docker push prathima2025/mypythonapp:latest
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                echo '⚙️ Deploying the new container...'
                sh '''
                    docker ps -q --filter "name=mypythonapp" | grep -q . && docker stop mypythonapp && docker rm mypythonapp || true
                    docker run -d -p 5000:5000 --name mypythonapp prathima2025/mypythonapp:latest
                '''
            }
        }

        stage('Cleanup') {
            steps {
                echo '🧹 Cleaning up old Docker images...'
                sh 'docker image prune -af || true'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Build failed. Please check logs.'
        }
    }
}
