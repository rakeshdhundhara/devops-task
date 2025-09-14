//   pipeline {
//       agent any

//       environment {
//           DOCKER_IMAGE = "rakeshbarwala/devops-task:latest"
//       }

//       stages {
//           stage('Checkout') {
//               steps {
//                   git branch: 'main',
//                       url: 'https://github.com/rakeshdhundhara/devops-task.git',
//                       credentialsId: 'github-token'
//               }
//           }

//           stage('Build Docker Image') {
//               steps {
//                   sh """
//                   echo "Building Docker image..."
//                   docker build -t $DOCKER_IMAGE .
//                   """
//               }
//           }

//           stage('Push to Docker Hub') {
//               steps {
//                    withCredentials([string(credentialsId: 'docker-hub', variable: 'DOCKER_PASS')]){
//                       sh """
//                       echo "Logging in to Docker Hub..."
//                       echo $DOCKER_PASS | docker login -u rakeshbarwala --password-stdin
//                       docker push $DOCKER_IMAGE
//                       """
//                   }
//               }
//           }

//           stage('Deploy to Minikube') {
//               steps {
//                   sh """
//                   echo "Deploying to Minikube..."
//                   kubectl config use-context minikube
//                   kubectl set image deployment/devops-task devops-task=$DOCKER_IMAGE --record || \
//                     kubectl create deployment devops-task --image=$DOCKER_IMAGE
//                   kubectl rollout status deployment/devops-task
//                   """
//               }
//           }
//       }
//   }

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
                    credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                echo Building Docker image...
                docker build -t rakeshbarwala/devops-task:latest .\\devops-task\\
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

        stage('Deploy to Minikube') {
            steps {
                bat """
                echo Deploying to Minikube...
                kubectl config use-context minikube
                kubectl set image deployment/devops-task devops-task=%DOCKER_IMAGE% --record || ^
                  kubectl create deployment devops-task --image=%DOCKER_IMAGE%
                kubectl rollout status deployment/devops-task
                """
            }
        }
    }
}
