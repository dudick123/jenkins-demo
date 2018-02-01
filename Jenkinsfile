pipeline {
  agent any
  stages {
    stage('Goof Around') {
      //Adding a comment
      steps {
        echo 'Running Setup'
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
    stage('Prepare Pipeline') {
      steps {
        sh 'bash ./cd/prepare-pipeline.sh'
      }
    }
    stage('Build Initial Image') {
      steps {
        sh 'bash ./cd/images-build-initial.sh'
      }
    }
    stage('Run Initial Container') {
      steps {
        sh 'bash ./cd/container-run-initial.sh'
      }
    }
    stage('Test Initial Container') {
      steps {
        sh 'bash ./cd/container-test-initial.sh'
      }
    }
    stage('Build DTR Image') {
      steps {
        sh 'bash ./cd/images-build-dtr.sh'
      }
    }
    stage('Push DTR Image') {
      steps {
        sh 'bash ./cd/images-push-dtr.sh'
      }
    }
  }
  environment {
    REPOSITORY_NAME = 'bdudick'
    IMAGE_TAG = 'test-web-app-rc1.2.3'
    CONTAINER_NAME = 'test-web-app-rc1.2.3-'
    FOO = 'PIPELINE'
  }
  post {
    always {
      echo 'Always is is always the first post pipeline step to run.'
      sh 'bash ./cd/teardown-pipeline.sh'
      archiveArtifacts(artifacts: '*.txt', fingerprint: true)
      
    }
    
    changed {
      echo 'CHANGED is run second'
      
    }
    
    aborted {
      echo 'This build was aborted. The system or the user stopped the run. Perform aborted actions.'
      
    }
    
    success {
      echo 'This build was successful. All steps completed. Perform successful type actions.'
      
    }
    
    unstable {
      echo 'This build is unstable. There was a test that failed. Perform unstable type actions.'
      
    }
    
    failure {
      echo 'This build is a failure. Build steps could not be completed. Perform unstable type actions'
      
    }
    
  }
  triggers {
    pollSCM('H 8-18/1 * * 1-5')
  }
}
