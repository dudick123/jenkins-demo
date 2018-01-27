pipeline {
  agent any
  stages {
    stage("foo") {
      steps {
        sh 'ls'  
        sh '''
            ./cd/images-build.sh
        '''		
      }
    }
  }
}
