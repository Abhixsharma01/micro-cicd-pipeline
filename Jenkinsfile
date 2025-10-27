pipeline {
    agent any

    environment {
        IMAGE_NAME = "user-service"
        CONTAINER_NAME = "user-service-container"
        PORT = "8081"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Skipping SCM checkout (running locally on Windows)...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    bat 'docker build -t %IMAGE_NAME%:latest .'
                }
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running Docker container...'
                script {
                    // Stop old container if running
                    bat 'docker stop %CONTAINER_NAME% || exit 0'
                    bat 'docker rm %CONTAINER_NAME% || exit 0'
                    // Run new one
                    bat 'docker run -d -p 8081:5000 --name user-service-container user-service:latest
'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Verifying if container is running...'
                script {
                    bat 'docker ps | find "%CONTAINER_NAME%"'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check logs.'
        }
    }
}
