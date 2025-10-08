pipeline {
    agent any

    tools {
        nodejs 'NodeJS_20'   // ✅ Matches the name you configured in Jenkins UI
    }

    environment {
        DEPLOY_DIR = '/var/www/site'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ichirei7/novastore-react-2.git'
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
            echo '✅ Deployed successfully to Nginx!'
        }
        failure {
            echo '❌ Build or deployment failed!'
        }
    }
}
