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
      environment {
        IMAGE_ID = sh(script: "docker images --filter=reference=${env.TAG} --format \"{{.ID}}\"", returnStdout: true).trim()
      }
      steps {
        withAWS(credentials:'demo-aws') {
          sh ecrLogin()
        }
        sh "docker tag ${env.IMAGE_ID} 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.TAG} ${env.REPO}:latest"
        sh "docker push 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.TAG}"
        build 'demo-sm-deploy'
      }
    }

  }
}
