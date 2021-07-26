pipeline {
           agent any
           stages {
                stage('Pull from GitHub') {
                    steps {  
                        git 'https://github.com/manisharayudu/Terraform_Jenkins.git'
                    }
                }
                stage("Hello") {
                    agent any
                     steps {
                          echo 'Hello World'
                    }
                }
                stage('Build Docker Image') {
                    agent any
                        steps {
                            sh 'docker build -t hello-world .'
                        }
                }
                stage('Run Docker Image') {
                    agent any
                        steps {
                            sh 'docker run -d -p 80:80 hello-world'
                        }
                }
                stage('Deploy Docker Image') {
                    agent any
                    steps {
                            withCredentials([string(credentialsId: 'manisharayudu12', variable: 'docker-hub')]) {
                                sh 'docker login -u manisharayudu12 -p ${docker-hub}'
                            }  
                            sh 'docker push manisharayudu12/learning:hello-world'
                    }
                }
           }
}
