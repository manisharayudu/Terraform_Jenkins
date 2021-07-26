pipeline {
           agent any
           stages {
                stage('Pull from GitHub') {
                    steps {  
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'manisharayudu', url: 'https://github.com/manisharayudu/Terraform_Jenkins.git']]])
                    }
                }
                stage('Build Docker Image') {
                    agent any
                        steps {
                            sh "docker build -t manisharayudu12/customnginx:${BUILD_NUMBER} ."
                        }
                }
                stage('Deploy Docker Image') {
                    agent any
                    steps {
                            withCredentials([string(credentialsId: 'manisharayudu12', variable: 'docker-hub')]) {
                                sh "docker login -u manisharayudu12 -p ${docker-hub}"
                            }  
                            sh "docker push manisharayudu12/customnginx:${BUILD_NUMBER}"
                    }
                }
           }
}
