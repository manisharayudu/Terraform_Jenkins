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
                            sh 'docker build -t manisharayudu/hello-world:1.0 .'
                        }
                }
                stage('Deploy Docker Image') {
                    agent any
                    steps {
                            withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                                sh 'docker login -u manisharayudu -p ${dockerhubpwd}'
                    }  
                            sh 'docker push manisharayudu/hello-world:1.0'
                }
            }
        }
    }
