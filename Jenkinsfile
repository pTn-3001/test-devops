pipeline {
  agent any

  stages{
    stage ('Pull Github repository'){
      steps{
        git branch: 'main',
        url: 'https://github.com/pTn-3001/test-devops.git'
      }
    }
    stage ('Build') {
      steps {
        withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t 22127025/mmtnc-proj3 .'
        }
      }
    }
  }
}