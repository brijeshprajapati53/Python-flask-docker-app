pipeline {
    agent any

    environment {
        // DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        // IMAGE_NAME = 'yourusername/flask-app'  // Replace with your Docker Hub repo name

        AZURE_CREDENTIALS_ID = 'azure-service-principal' // Must be configured in Jenkins credentials
        ACR_NAME = "acrbrijesh1238"
        ACR_LOGIN_SERVER = "acrbrijesh1238.azurecr.io"
        IMAGE_NAME = "mynodeapp"
        TAG = "latest"
        RESOURCE_GROUP = "examresource"
        LOCATION = "East US 2"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/brijeshprajapati53/Python-flask-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").push()
                }
            }
        }
    }

    post {
        success {
            echo '✅ Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
