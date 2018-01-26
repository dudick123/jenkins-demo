pipeline {
  agent any
  stages {
    stage('foo') {
      steps {
        sh 'ls'
        echo 'Hello ${MY_NAME}'
        //echo '${TEST_USER_USR}'
        //echo '${TEST_USER_PSW}'
      }
    }
  }
  environment {
    MY_NAME = 'Mary'
    TEST_USER = credentials('DOCKER_HUB_CREDS')
  }
}
