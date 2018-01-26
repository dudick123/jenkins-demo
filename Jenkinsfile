pipeline {
  agent {
      docker { image 'maven:3.3-jdk-8' }
   }
  stages {
    stage("foo") {
      steps {
        sh 'cat /hi-there'
        sh 'echo "The answer is 42"'
      }
    }
  }
}
