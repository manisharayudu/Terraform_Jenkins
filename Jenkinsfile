pipeline {
           agent any
           stages {
                stage("Hello") {
                    agent any
                     steps {
                          echo 'Hello World'
                    }
                }
                stage('Build Docker Image') {
                    agent any
                        steps {
                            sh 'docker build -t manisharayudu12/hello-world:1.0 .'
                        }
                }
                stage('Deploy Docker Image') {
                    agent any
                    steps {
                            withCredentials([string(credentialsId: 'manisharayudu12', variable: 'docker-hub')]) {
                                sh 'docker login -u manisharayudu12 -p ${docker-hub}'
                            }  
                            sh 'docker push manisharayudu12/hello-world:1.0'
                    }
                }
           }
}
