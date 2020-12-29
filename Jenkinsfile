pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
    stage('Cleaning Up'){
      steps{
        sh "rm -fR *terraform*"
      }
    }
    stage('Terraform Initiation - Format - Validate'){
      steps{
        sh "terraform init"
        sh "terraform fmt"
        sh "terraform validate"
      }
    }
    stage('Approve To Deploy Into Dev Environment'){
      steps{
        input "Deploy To Dev"
      }
    }
    stage('Terraform execution for DEV Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform workspace select dev"
        sh "terraform plan -var-file=dev.tfvars"
        sh "terraform apply -var-file=dev.tfvars -auto-approve"
      }
    }
    stage('Approve To Deploy Into QA Environment'){
      steps{
        input "Deploy To QA"
      }
    }
    stage('Terraform execution for QA Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new qa'
        sh "terraform workspace select qa"
        sh "terraform plan -var-file=qa.tfvars"
        sh "terraform apply -var-file=qa.tfvars -auto-approve"
      }
    }
    stage('Approve To Deploy Into Staging Environment'){
      steps{
        input "Deploy To Staging"
      }
    }
    stage('Terraform execution for Staging Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new staging'
        sh "terraform workspace select staging"
        sh "terraform plan -var-file=staging.tfvars"
        sh "terraform apply -var-file=staging.tfvars -auto-approve"
      }
    }
  }
}

def getTerraformPath(){
  def tfhome = tool name: 'terraform-0.14', type: 'terraform'
  return tfhome
}
