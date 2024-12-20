pipeline {
  agent any
  
  tools {
    maven 'my-maven'
  }

  stages{
    stage ('Pull Github repository'){
      steps{
        git branch: 'main', url: 'https://github.com/21120414/devops-HCMUS.git'
      }
    }

    stage('Build with Maven') {
        steps {
            bat 'mvn --version'
            bat 'java -version'
            bat 'mvn clean package -Dmaven.test.failure.ignore=true'
        }
    }
  }

  post {
      // Clean after build
      always {
          cleanWs()
      }
  }
}