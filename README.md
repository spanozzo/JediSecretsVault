# JediSecretsVault

## Overview
I've chosen to use Terraform modules to keep the code readable and easier to maintain it.
The project uses these AWS services: Lambda, S3, KMS, and Secrets Manager, IAM.

## Project Structure

- **modules/**: Contains reusable Terraform modules.
  - **iam/**: Module for creating IAM roles and policies.
  - **kms/**: Module for creating the KMS key for encrypting data in the S3 bucket.
  - **lambda/**: Module for creating the Lambda function to process Jedi manifests uploaded to the S3 bucket.
  - **s3/**: Module for creating the S3 bucket encrypted with KMS where Jedi manifests can be uploaded.
  - **secrets_manager/**: Module for creating the secret in AWS Secrets Manager to securely store the Jedi ID.
- **main.tf**: Main Terraform file that uses the above modules.
- **variables.tf**: Definitions of variables used in `main.tf`.
- **lambda_function.zip**: Zip archive containing the source code for the Lambda function.

## Other comments:
- In a real enviroment should have been better to keep the lambda function code in an S3 bucket and reference it from the terraform configuration.
- The value for the 'jediID' secret isn't defined as variable but I assume that is given to Terraform as ENV variable (export  TF_VAR_jedi_id='xxx') or as variable during Terraform execution (terraform apply -var="jedi_id=xxx")
- I assume that already exist a role called 'councilRole' with the necessary permission
- most of the policies have permission on all resources (Resource = '*') for simplicity

## Lambda execution
The lambda function is executed whenever a new manifest is uploaded to S3. This, after parsing the manifest json and retrieving the ID of the Jedi of interest, returns information about the requested Jedi, if it is present in the manifest.