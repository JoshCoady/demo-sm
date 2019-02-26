pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        script {
          docker.build("demo/demo-sm:${env.GIT_COMMIT}")
        }
      }
    }
  }
}
