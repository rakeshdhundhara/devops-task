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
                docker build -t %DOCKER_IMAGE% -f Dockerfile devops-task
                '''
                
            }
        }

        stage('Push to Docker Hub') {
            steps {
                
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred',
                                                usernameVariable: 'DOCKER_USER',
                                                passwordVariable: 'DOCKER_PASS')]) {
                    bat """
                    echo Logging in to Docker Hub...
                    echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                    docker push %DOCKER_IMAGE%
                    """
                }
            }
        }

    }
}
