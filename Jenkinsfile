pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "rakeshbarwala/devops-task:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/rakeshdhundhara/devops-task.git',
                    credentialsId: 'github-tokenA'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                echo Building Docker image...
                docker build -t %DOCKER_IMAGE% .
                '''
                
            }
        }
        stage('Check Docker') {
            steps {
                bat 'docker --version'
                bat 'docker ps'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                
                withCredentials([string(credentialsId: 'dockercredentialA',
                                                variable: 'DOCKER_PASS')]) {
                    bat """
                    echo Logging in to Docker Hub...
                    echo %DOCKER_PASS% | docker login -u rakeshbarwala --password-stdin
                    docker push %DOCKER_IMAGE%
                    docker logout
                    """
                }
            }
        }

    }
}
