######################
#  ses/variables.tf  #
######################

variable "domain" {
  description = "Domain name for domain identity"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "CloudFlare zone id"
  type        = string
  default     = ""
}

variable "sns_topic_arn" {
  description = "ARN of SNS topic"
  type        = string
  default     = ""
}

variable "route53_zone_id" {
  description = "Route53 zone id"
  type        = string
  default     = ""
}
