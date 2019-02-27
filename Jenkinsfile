pipeline {
  agent any

  environment {
    TAG = "demo-staging-sm:${env.GIT_COMMIT}"
  }

  stages {

    stage('Build') {
      steps {
        sh "docker build -t ${env.TAG} ."
      }
    }

    stage('Deliver') {
      environment {
        IMAGE_ID = sh(script: "docker images --filter=reference=${env.TAG} --format \"{{.ID}}\"", returnStdout: true).trim()
      }
      steps {
        withAWS(credentials:'demo-aws') {
          sh ecrLogin()
        }
        sh "docker tag ${env.IMAGE_ID} 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.TAG}"
        sh "docker push 070468416971.dkr.ecr.us-east-1.amazonaws.com/${env.TAG}"
      }
    }

  }
}
