pipeline {
  agent any

  environment {
    REPO = "demo-staging-sm"
    TAG = "${env.REPO}:${env.GIT_COMMIT}"
  }

  stages {

    stage('Build') {
      steps {
        sh "docker build -t ${env.TAG} ."
      }
    }

    stage('Deliver') {
      when {
        branch "master"
      }
      steps {
        withAWS(credentials:'demo-aws') {
          sh ecrLogin()
        }
        sh "docker tag ${env.TAG} 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.REPO}:latest"
        sh "docker push 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.REPO}:latest"
        build 'demo-sm-deploy'
      }
    }

  }
}
