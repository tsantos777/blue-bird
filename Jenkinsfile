pipeline {
  agent any

  environment {
    DOKKU_HOST = '172.234.28.110'
    APP_NAME = 'blue-bird'
  }

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
