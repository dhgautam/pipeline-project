@Library('shared-library') _
pipeline {
  agent any
  stages {
    stage('Build') {
          steps {
            echo "Starting the build"
            runBuild(name: "build.sh", arg: "package")
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
        timeout(time: 3, unit: 'MINUTES' ) {
          input(message: "Okay to Deploy to Staging?", ok: "Let's roll!")
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
