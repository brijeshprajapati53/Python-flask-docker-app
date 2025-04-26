pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = "brijeshprajapati53/python-flask-docker-app"
    }

    stages {
        stage('Clone Repository') {
    steps {
        git branch: 'main', url: 'https://github.com/brijeshprajapati53/Python-flask-docker-app.git'
    }
}


        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                bat """
                echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin
                """
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                bat "docker push %IMAGE_NAME%"
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
