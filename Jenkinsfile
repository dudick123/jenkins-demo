pipeline {
  //adding comments from test branch
  agent any
  
  // Options covers all other job properties or wrapper functions that apply to entire Pipeline.
  options {
    buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    disableConcurrentBuilds()
    timeout(time: 5, unit: 'MINUTES')
    timestamps()
  }
  
  stages {
    stage('Goof Around') {
      steps {
        echo 'Running Setup'
        sh 'ls -lh'
        sh 'whoami'
        sh 'ls -lh >> root_dir.txt'
        echo 'Test Update'
      }
    }
    stage('Prepare Pipeline') {
      steps {
        sh 'bash ./cd/pipeline-prepare.sh'
      }
    }
    stage('Build Initial Image') {
      steps {
        sh 'bash ./cd/images-build-initial.sh'
      }
    }
    stage('Run Initial Container') {
      steps {
        sh 'cat ./cd/containers-run-initial.sh'
        sh 'bash ./cd/containers-run-initial.sh'
      }
    }
    stage('Test Initial Container') {
      steps {
        sh 'curl http://localhost:8181'
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
    CONTAINER_NAME = 'test-web-app-rc1.2.3'
    DTR_CREDS = credentials('docker-bdudick-credentials')
  }
  post {
    always {
      echo 'Always is is always the first post pipeline step to run.'
      sh 'bash ./cd/pipeline-post-always.sh'
	  archive '**/*.txt'
	  deleteDir() /* clean up our workspace */
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
      sh 'bash ./cd/pipeline-post-failure.sh'
      
    }
    
  }
}
