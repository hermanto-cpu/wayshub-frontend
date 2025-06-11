pipeline {
    agent any
    environment {
        IMAGE_NAME = "totywan/wayshub-frontend13alpine"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/hermanto-cpu/wayshub-frontend.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'totywan-dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    sh "docker push $IMAGE_NAME"
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker stop wayshub-fe || true && docker rm wayshub-fe || true'
                sh 'docker run -d --name wayshub-fe -p 3000:3000 totywan/wayshub-frontend13alpine'
            }
        }
    }
}
