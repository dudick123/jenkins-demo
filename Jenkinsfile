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
            ls
            touch foo.txt
            ls
            images-build.sh
        '''		
      }
    }
  }
}
