pipeline {
  agent any
  stages {
    stage("foo") {
      steps {
        sh 'ls'  
        sh 'whoami'
        //sh '''
        //    ./cd/images-build.sh
        //'''		
      }
    }
  }
}
