pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/var/www/site'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'novastore-react-2'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Archive Build') {
            steps {
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh '''
                    rm -rf ${DEPLOY_DIR}/*
                    cp -r dist/* ${DEPLOY_DIR}/
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployed successfully!'
        }
        failure {
            echo '❌ Build or deploy failed!'
        }
    }
}
