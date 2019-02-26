pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        docker.build("demo/demo-sm:${env.GIT_COMMIT}")
      }
    }
  }
}
