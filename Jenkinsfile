pipeline {
  agent any
  stages {
    stage('foo') {
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
        '''
        sh 'sudo docker -v ' //stop web-app -f && sudo docker rm web-app'
      }
    }
    stage('Build Image') {
      steps {
        echo 'Building Images'
        //sh 'docker build --tag web-app:$BUILD_NUMBER .'        
      }
    }
  }
}
