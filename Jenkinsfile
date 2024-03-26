pipeline{
    agent {
        label 'dind'
    }
    options {
        timeout(time: 60, unit: 'MINUTES')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test run') {
            steps {
                sh """
                echo "Hello World!"
                """
            }
        }
    }
}
