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
    stage('Approve To Deploy Into Dev Environment'){
      input "Deploy To Dev"
    }
    stage('terraform execution for DEV Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan -var-file=dev.tfvars"
        sh "terraform apply -var-file=dev.tfvars -auto-approve"
      }
    }
    stage('Approve To Deploy Into QA Environment'){
      input "Deploy To QA"
    }
    stage('terraform execution for QA Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new qa'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan -var-file=qa.tfvars"
        sh "terraform apply -var-file=qa.tfvars -auto-approve"
      }
    }
    stage('Approve To Deploy Into Staging Environment'){
      input "Deploy To Staging"
    }
    stage('terraform execution for Staging Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new staging'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
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
