pipeline {
  agent any
  stages {
    stage('foo') {
      steps {
        sh 'ls -lh'
        sh 'whoami'
        sh '''
            whoami
            touch foo.txt
            ls
            cd cd/
            ls -lh
        '''
      }
    }
    stage('Build Image') {
      steps {
        echo 'Building Images'
        sh 'docker build --tag test-web-app-rc1.2.3:$BUILD_NUMBER .'
      }
    }
    stage('Run Container') {
      steps {
        echo 'Running Container'
        sh 'docker container run -d --rm -p 80:80 --name test-web-app-rc1.2.3-$BUILD_NUMBER test-web-app-rc1.2.3:$BUILD_NUMBER'
      }
    }
    stage('Test Container') {
      steps {
        echo 'Testing Container'
        sh 'curl http://localhost'
      }
    }
    stage('Experiment') {
      steps {
        echo 'Running Experiment Stage'
         sh '''
            bash ./cd/images-test.sh
          '''
      }
    }
    stage('Build DTR Image Latest') {
      steps {
        echo 'Building DTR Images'
        sh 'docker build --tag bdudick/test-web-app-1.2.3:latest .'
      }
    }
    stage('Push DTR Image Latest') {
      steps {
        echo 'Push DTR Images'
        //sh 'docker build --tag test-web-app-rc1.2.3:$BUILD_NUMBER .'
      }
    }
  }
  post {
    /*
     * These steps will run at the end of the pipeline based on the condition.
     * Post conditions run in order regardless of their place in pipeline
     * 1. always - always run
     * 2. changed - run if something changed from last run
     * 3. aborted, success, unstable or failure - depending on status
     */
        always {
            echo "I AM ALWAYS first"
            sh 'docker container stop test-web-app-rc1.2.3-$BUILD_NUMBER'
            //move the docekr image rmi step to? 
            sh 'docker image rmi test-web-app-rc1.2.3:$BUILD_NUMBER'
            archiveArtifacts artifacts: '*.txt', fingerprint: true
        }
        changed {
            echo "CHANGED is run second"
        }
        aborted {
          echo "SUCCESS, FAILURE, UNSTABLE, or ABORTED are exclusive of each other"
        }
        success {
            echo "SUCCESS, FAILURE, UNSTABLE, or ABORTED runs last"
        }
        unstable {
          echo "SUCCESS, FAILURE, UNSTABLE, or ABORTED runs last"
        }
        failure {
            echo "SUCCESS, FAILURE, UNSTABLE, or ABORTED runs last"            
        }
    }
}
