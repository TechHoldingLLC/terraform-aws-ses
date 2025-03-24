####################
#  ses/outputs.tf  #
####################

output "domain" {
  description = "Name of the domain identity"
  value       = aws_ses_domain_identity.ses_domain.domain
}

output "arn" {
  description = "The ARN of the domain identity"
  value       = aws_ses_domain_identity.ses_domain.arn
}
