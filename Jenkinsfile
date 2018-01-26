pipeline {
  agent {
    docker {
      image 'nginx:alpine'
    }
    
  }
  stages {
    stage('foo') {
      steps {
        sh 'ls'
        sh 'echo "The answer is 42"'
      }
    }
  }
}