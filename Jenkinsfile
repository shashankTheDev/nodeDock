pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_HUB_REPO = 'shashank/shashank'
        DOCKER_HUB_CREDENTIALS_ID = 'dock-password'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git
                git branch: 'main', url: 'https://github.com/shashankTheDev/nodeDock.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://hub.docker.com//', DOCKER_HUB_CREDENTIALS_ID) {
                        docker.image("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
