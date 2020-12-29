pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
    stage('terraform execution for DEV Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
        sh "terraform apply -var-file=dev.tfvars -auto-approve"
      }
    }
    stage('terraform execution for QA Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new qa'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
        sh "terraform apply -var-file=qa.tfvars -auto-approve"
      }
    }
    stage('terraform execution for Staging Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new staging'
        sh "terraform init -reconfigure -backend=true -force-copy"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
        sh "terraform apply -var-file=staging.tfvars -auto-approve"
      }
    }
  }
}

def getTerraformPath(){
  def tfhome = tool name: 'terraform-0.14', type: 'terraform'
  return tfhome
}
