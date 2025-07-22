pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')     // Jenkins credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds') // Jenkins credential ID
    }

    stages {

        stage('Terraform Init') {
            steps {
                echo 'Initializing Terraform...'
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                echo 'Validating Terraform configuration...'
                sh 'terraform validate'
            }
        }

        stage('Terraform Format Check') {
            steps {
                echo 'Checking Terraform formatting...'
                sh 'terraform fmt'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Generating Terraform execution plan...'
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
                echo 'Applying Terraform changes...'
                sh 'terraform apply'
            }
        }
    }
}

