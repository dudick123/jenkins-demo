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
        //sh 'docker -v ' //stop web-app -f && sudo docker rm web-app'
        //sh 'docker stop web-app' //stop the container named web application
      }
    }
    stage('Build Image') {
      steps {
        echo 'Building Images'
        sh 'docker build --tag web-app:$BUILD_NUMBER .'        
      }
    }
    stage('Run Container') {
      steps {
        echo 'Running Container'
        sh 'docker container run -d -p 8000:8000 --name web-app-$BUILD_NUMBER web-app:$BUILD_NUMBER'        
      }
    }
    stage('Test Container') {
      steps {
        echo 'Testing Container'
        sh 'curl http://localhost:8000'        
      }
    }    
  }
}
