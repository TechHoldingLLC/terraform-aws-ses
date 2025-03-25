###################
#  ses/lambda.tf  #
###################

module "lambda_ses_logging" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-lambda-function.git?ref=v1.0.11"

  count = var.enable_ses_logging ? 1 : 0

  function_name  = local.ses_logging_name
  handler        = "ses-logging.lambda_handler"
  lambda_runtime = "python3.8"
  source_file    = "lambda/ses-logging.py"
  output_path    = "lambda/ses-logging.zip"
  description    = "Lambda function for SES logging"
  logs_retention = var.ses_logs_retention_period

  allowed_triggers = {
    SNS = {
      statement_id = "AllowInvocationFromSNS"
      principal    = "sns.amazonaws.com"
      source_arn   = aws_sns_topic.ses_logging[0].arn
    }
  }
}
