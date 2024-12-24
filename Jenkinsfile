pipeline {
  agent any

  stages{
    stage ('Pull Github repository'){
      steps{
        git branch: 'main',
        url: 'https://github.com/pTn-3001/test-devops.git'
      }
    }
  }
}