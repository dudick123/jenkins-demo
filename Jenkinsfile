pipeline {
  agent any
  stages {
    stage("foo") {
      steps {
        sh 'ls'  
        sh 'whoami'
        sh '''
            whoami
            ls
            cd cd/
        '''		
      }
    }
  }
}
