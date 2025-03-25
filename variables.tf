######################
#  ses/variables.tf  #
######################

variable "cloudflare_zone_id" {
  description = "CloudFlare zone id"
  type        = string
  default     = ""
}

variable "domain" {
  description = "Domain name for domain identity"
  type        = string
}

variable "enable_ses_logging" {
  description = "Enable SES logging"
  type        = bool
  default     = false
}

variable "feedback_notification_type" {
  description = "Feedback notification type, valid values are Bounce, Complaint, Delivery"
  type        = list(string)
  default     = ["Bounce", "Complaint", "Delivery"]
}

variable "ses_logs_retention_period" {
  description = "SES logs retention period"
  type        = number
  default     = 30
}

variable "route53_zone_id" {
  description = "Route53 zone id"
  type        = string
  default     = ""
}
