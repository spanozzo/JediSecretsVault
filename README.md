# Jedi Secrets Vault

## Overview
This project employs Terraform modules for enhanced readability and maintainability. It integrates several AWS services, including Lambda, S3, KMS, Secrets Manager, and IAM, to manage and process Jedi-related data securely.

## Project Structure

- **modules/**: This directory contains the Terraform modules used across the project.
  - **iam/**: A module dedicated to creating IAM roles and policies.
  - **kms/**: A module for generating a KMS key to secure data within the S3 bucket.
  - **lambda/**: This module manages the Lambda function responsible for processing Jedi manifests in the S3 bucket.
  - **s3/**: Manages the S3 bucket, encrypted with the KMS key, for storing Jedi updated manifests.
  - **secrets_manager/**: Handles the creation of a secret in AWS Secrets Manager for the safekeeping of the Jedi ID.
- **main.tf**: The primary Terraform script that incorporates the other modules.
- **lambda_function.zip**: A zip file containing the Lambda function's source code.

All the modules containes the `main.tf` file for the resource definition, the `variables.tf` file for the definition of the variables used in the `main.tf` and, if needed, the `outputs.tf` file for exposing the outputs of modules to other ones.

## Implementation Notes:
- In a production environment, it's advisable to store the Lambda function code in an S3 bucket and reference it in the Terraform configuration instead of using a zip file as done here.
- The 'jediID' secret is not set as a variable but is expected to be provided as an environment variable to Terraform (e.g., `export TF_VAR_jedi_id='xxx'`) or as a runtime variable (e.g., `terraform apply -var="jedi_id=xxx"`).
- It is assumed that a role named `councilRole` with requisite permissions already exists.
- For simplicity, most policies are configured with permissions on all resources (`Resource = '*'`).

## Lambda Execution
The Lambda function triggers upon the upload of a new manifest to the S3 bucket. It gets the Jedi ID from the secrets, processes the manifest JSON to extract the relevant Jedi ID and returns information about the specified Jedi, if present in the manifest.
