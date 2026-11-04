pipeline {
    agent any

    environment {
        IMAGE     = 'sample-website'
        CONTAINER = 'sample-website'
        PORT      = '8081'
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins already pulls the repo via the job's SCM config,
                // this just prints what was checked out.
                sh 'ls -la'
            }
        }

        stage('Build image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Deploy container') {
            steps {
                // Remove any old container, then run the new one.
                sh 'docker rm -f $CONTAINER || true'
                sh 'docker run -d --name $CONTAINER -p $PORT:80 $IMAGE'
            }
        }
    }

    post {
        success {
            echo 'Deployed! Open http://localhost:8081'
        }
        failure {
            echo 'Build failed - check the stage logs above.'
        }
    }
}
