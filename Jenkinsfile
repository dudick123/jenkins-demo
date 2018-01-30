pipeline {
  agent any
  triggers {
        pollSCM('H 8-18/1 * * 1-5')
  }
  
  environment {
    // Eliminate magic strings
	REPOSITORY_NAME = "bdudick"
    IMAGE_TAG = "test-web-app-rc1.2.3:"
	CONTAINER_NAME = "test-web-app-rc1.2.3-"
	FOO = "PIPELINE"
  }
  
  stages {
    stage('foo') {
      steps {
        sh 'ls -lh'
        sh 'whoami'
        sh '''
            touch foo.txt
            ls            
            cd cd/
            ls -lh
        '''
      }
    }
    stage('Build Test Image') {
      steps {
        echo 'Building Images'
        sh 'docker build --tag $IMAGE_TAG:$BUILD_NUMBER .'
      }
    }
    stage('Run Test Container') {
      steps {
        echo 'Running Container'
        sh 'docker container run -d --rm -p 80:80 --name $CONTAINER_NAME-$BUILD_NUMBER $IMAGE_TAG:$BUILD_NUMBER'
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
    stage('Build DTR Image') {
      steps {
        echo 'Building DTR Images'
        sh 'docker build --tag $REPOSITORY_NAME/$IMAGE_TAG:latest .'
		sh 'docker image inspect $REPOSITORY_NAME/IMAGE_TAG:latest'
      }
    }
    stage('Push DTR Image') {
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
            sh 'docker container stop $CONTAINER_NAME-$BUILD_NUMBER'
            //move the docekr image rmi step to? 
            sh 'docker image rmi IMAGE_TAG:$BUILD_NUMBER'
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
