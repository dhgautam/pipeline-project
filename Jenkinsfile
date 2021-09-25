pipeline {
  agent any
  stages {
    stage('Build') {
          steps {
            echo "Starting the build"
            sh './jenkins/build.sh'
          }
        }
    stage('Test') {
          steps {
            sh './jenkins/run-tests.sh'
          }
      }
    stage('Confirm Deploy') {
      when {
        branch 'main'
      }
      steps {
        timeout(time: 1, unit: 'MINUTES' ) {
          input(message: "Okay to Deploy to Staging?", ok: "Let's Do it!")
        }
      }
    }
    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        sh "./jenkins/deploy.sh ${params.DEPLOY_TO}"
      }
    }
  }
  parameters {
    string(name: 'DEPLOY_TO', defaultValue: 'dev', description: '')
  }
}
