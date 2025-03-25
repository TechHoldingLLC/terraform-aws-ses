#################
#  ses/data.tf  #
#################

data "aws_region" "current" {}

locals {
  region = data.aws_region.current.name

  # To avoid the error for invalid value for lambda function and sns topic name
  # domain=test.com ==> ses_logging_name=test-com-ses-logging
  ses_logging_name = "${replace(var.domain, ".", "-")}-ses-logging"
}
