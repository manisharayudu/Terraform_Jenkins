pipeline {
           agent any
           stages {
                stage("Hello") {
                     steps {
                          echo 'Hello World'
                     }
           } 
                stage('Build Docker Image') {
                    steps {
                        script {
                            sh 'docker build -t manisharayudu/my-app-1.0 .'
                }
            }
        }
                stage('Deploy Docker Image') {
                    steps {
                        script {
                            withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                                sh 'docker login -u manisharayudu -p ${dockerhubpwd}'
                 }  
                            sh 'docker push manisharayudu/my-app-1.0'
                }
            }
        }
    }
}
