# Terraform-LabExercise

This project will deploy the following infrastructure components into AWS: S3 bucket, VPC, EC2 instance and lambda function.

At the moment there are three pipelines that can be ran from the Actions tab in the GitHub repo:
1. **Terraform Deployment us-east-1 qa**
    * Runs automatically everytime code is pushed into the dev branch.
    * Can also be ran manually from the Actions tab >> Run workflow button.
2. **Terraform Deploy qa/staging/prod in us-east-1 and us-west-1**
    * Can be ran manually as needed to deploy the infrasture into the desireg region and env. After pressing the Run workbook button you can select the branch to be used for code source, AWS reagion into wich to deploy (us-east1/us-west-1) and the environment (qa/staging/prod).
3. **Terraform Destroy qa/staging/prod in us-east-1 and us-west-1**
    * Similar to #2, can be ran manually as needed to destroy the infrasture from the desireg region and env.
