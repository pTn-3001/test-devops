pipeline {
  agent any

  stages{
    stage ('Pull Github repository'){
      steps{
        git branch: 'main',
        url: 'https://github.com/pTn-3001/test-devops.git'
      }
    }
    stage ('Build and publish Docker image') {
      steps {
        withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') {
          bat 'docker build -t 22127025/mmtnc-proj3 .'
          bat 'docker push 22127025/mmtnc-proj3'
        }
      }
    }
  }
}