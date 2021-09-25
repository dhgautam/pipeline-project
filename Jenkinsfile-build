pipeline {
  agent any
  stages {
    stage('Build') {
          steps {
            echo "Starting the build"
            sh './scripts/build.sh compile'
          }
        }
    stage('Test') {
          steps {
            sh './scripts/run-tests.sh'
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
        sh "./scripts/deploy.sh ${params.deployTo}"
      }
    }
  }
  parameters {
    string(name: 'deployTo', defaultValue: 'dev', description: '')
  }
}
