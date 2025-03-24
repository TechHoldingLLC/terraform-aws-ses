################
#  ses/ses.tf  #
################

#------------------------------------------------------
# Resource for creating domain identity
#------------------------------------------------------
resource "aws_ses_domain_identity" "ses_domain" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "ses_dkim" {
  domain = aws_ses_domain_identity.ses_domain.domain
}

resource "aws_ses_domain_mail_from" "bounce" {
  domain           = aws_ses_domain_identity.ses_domain.domain
  mail_from_domain = "bounce.${aws_ses_domain_identity.ses_domain.domain}"
}

resource "aws_ses_identity_notification_topic" "ses" {
  for_each = length(var.sns_topic_arn) > 0 ? toset(["Bounce", "Complaint", "Delivery"]) : toset([])

  topic_arn                = var.sns_topic_arn
  notification_type        = each.key
  identity                 = aws_ses_domain_identity.ses_domain.domain
  include_original_headers = true
}
