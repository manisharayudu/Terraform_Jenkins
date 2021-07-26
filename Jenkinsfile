pipeline {
           agent any
            tools {
        maven 'MAVEN'
            } 
           stages {
                stage("Hello") {
                     steps {
                          echo 'Hello World'
                     }
           } 
                stage('Build Maven') {
                    steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'manisharayudu', url: 'https://github.com/manisharayudu/Terraform_Project.git']]])

                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                
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
