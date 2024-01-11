pipeline {
  agent any

  environment {
    DOKKU_HOST = '172.234.28.110'
    APP_NAME = 'blue-bird'
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    // Skipping the 'Build' stage
    // stage('Build') {
    //   steps {
    //     sh 'bundle install'
    //   }
    // }
    
  stage('Deploy to Dokku') {
      steps {
        script {
          sshagent(['6a99c4aa-790b-4202-839e-4c298b11cefe']) {
            sh "git push dokku main"
          }
        }
      }
    }
  }
}
