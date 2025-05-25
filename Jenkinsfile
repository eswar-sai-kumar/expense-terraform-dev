// plugins: ansicolor, aws-credentials
def withAwsCredentials(Closure body) {
    withCredentials([[
        $class: 'UsernamePasswordMultiBinding',
        credentialsId: 'aws-credentials', // Jenkins credential ID
        usernameVariable: 'AWS_ACCESS_KEY_ID',
        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
    ]]) {
        body()
    }
}

pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }

    parameters {
        choice(name: 'action', choices: ['Apply', 'Destroy'], description: 'Pick Terraform action')
        choice(name: 'module', choices: ['01-vpc', '02-sg', '03-bastion', '04-db', '05-apps'], description: 'Pick Terraform module')
    }
    
    stages {
        stage('Init') {
            steps {
                script {
                    withAwsCredentials {
                        sh """
                            cd ${params.module}
                            terraform init -reconfigure
                        """
                    }
                }
            }
        }
        stage('Plan') {
            when {
                expression{
                    params.action == 'Apply'
                }
            }
            steps {
                script {
                    withAwsCredentials {
                        sh """
                            cd ${params.module}
                            terraform plan
                        """
                    }
                }
            }
        }
        stage('Deploy') {
            when {
                expression{
                    params.action == 'Apply'
                }
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
            } 
            steps {
                script {
                    withAwsCredentials {
                        sh """
                            cd ${params.module}
                            terraform apply -auto-approve
                        """
                    }
                }
            }
        }

        stage('Destroy') {
            when {
                expression{
                    params.action == 'Destroy'
                }
            }
            steps {
                script {
                    withAwsCredentials {
                        sh """
                            cd ${params.module}
                            terraform destroy -auto-approve
                        """
                    }
                }
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}