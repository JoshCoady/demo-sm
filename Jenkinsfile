pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh "docker build -t \"demo/demo-sm:${env.GIT_COMMIT}\" ."
      }
    }
  }
}
