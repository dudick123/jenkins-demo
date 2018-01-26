pipeline {
  agent any
  stages {
    stage('foo') {
      steps {
        sh 'ls'
        echo 'Hello $MY_NAME'
      }
    }
  }
  environment {
    MY_NAME = 'Mary'
  }
}