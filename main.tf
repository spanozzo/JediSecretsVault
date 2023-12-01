provider "aws" {
  region = "eu-central-1"
}

module "kms" {
  source = "./modules/kms"
  aws_account_id = "xxx"
  role_name      = "council_role"
}

module "iam" {
  source = "./modules/iam"
  aws_region           = "eu-central-1"
  aws_account_id       = "xxx"
  lambda_function_name = "process_manifest"
}

module "lambda" {
  source                  = "./modules/lambda"
  lambda_function_name    = "process_manifest"
  lambda_role_arn         = module.iam.lambda_role_arn
  lambda_handler          = "index.handler"
  lambda_runtime          = "python3.9"
  lambda_source_file_path = "${path.module}/lambda_function.zip"
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = "jedi-manifest"
  kms_key_arn = module.kms.kms_key_arn
  lambda_function_arn  = module.lambda.lambda_arn
}

module "secrets_manager" {
  source = "./modules/secrets_manager"
  jedi_secret_name = "jediID"
  jedi_secret_value = var.jedi_id
}