################
#  ses/sns.tf  #
################

resource "aws_sns_topic" "ses_logging" {
  count = var.enable_ses_logging ? 1 : 0

  name = local.ses_logging_name
}
