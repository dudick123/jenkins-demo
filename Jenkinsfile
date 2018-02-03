pipeline {
  agent any
  stages {
    stage('Goof Around') {
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
        sh 'bash ./cd/containers-test-initial.sh'
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
        sh 'echo "FOO is $FOO"'
        sh 'echo "FOO_USR is $FOO_USR"'
        sh 'echo "FOO_PSW is $FOO_PSW"'
        dir(path: 'combined') {
          sh 'echo $FOO > foo.txt'
        }
        
        sh 'echo $FOO_PSW > foo_psw.txt'
        sh 'echo $FOO_USR > foo_usr.txt'
        archive '**/*.txt'
        sh 'bash ./cd/images-push-dtr.sh'
      }
    }
  }
  environment {
    REPOSITORY_NAME = 'bdudick'
    IMAGE_TAG = 'test-web-app-rc1.2.3'
    CONTAINER_NAME = 'test-web-app-rc1.2.3'
    FOO = credentials('docker-bdudick-credentials')
  }
  post {
    always {
      echo 'Always is is always the first post pipeline step to run.'
      sh 'bash ./cd/pipeline-post-always.sh'
      archiveArtifacts(artifacts: '*.txt', fingerprint: true)
      
    }
    
    changed {
      echo 'CHANGED is run second'
      sh 'bash ./cd/pipeline-post-changed.sh'
      
    }
    
    aborted {
      echo 'This build was aborted. The system or the user stopped the run. Perform aborted actions.'
      
    }
    
    success {
      echo 'This build was successful. All steps completed. Perform successful type actions.'
      sh 'bash ./cd/pipeline-post-success.sh'
      
    }
    
    unstable {
      echo 'This build is unstable. There was a test that failed. Perform unstable type actions.'
      
    }
    
    failure {
      echo 'This build is a failure. Build steps could not be completed. Perform unstable type actions'
      sh 'bash ./cd/pipeline-post-failure.sh'
      
    }
    
  }
  triggers {
    pollSCM('H 8-18/1 * * 1-5')
  }
}