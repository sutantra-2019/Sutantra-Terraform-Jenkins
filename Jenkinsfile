pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
    stage('terraform execution for DEV Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
      }
    }
    stage('terraform execution for QA Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new qa'
        sh "terraform init"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
      }
    }
    stage('terraform execution for Staging Environment'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new staging'
        sh "terraform init"
        sh "terraform fmt"
        sh "terraform validate"
        sh "terraform plan"
      }
    }
  }
}

def getTerraformPath(){
  def tfhome = tool name: 'terraform-0.14', type: 'terraform'
  return tfhome
}
