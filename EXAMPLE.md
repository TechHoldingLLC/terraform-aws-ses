# Usage Examples

## Basic Usage with Cloudflare DNS
```hcl
module "ses" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-ses.git"

  domain             = "example.com"
  cloudflare_zone_id = "your-cloudflare-zone-id"
}
```

## Using with Route53 DNS
```hcl
module "ses" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-ses.git"

  domain           = "example.com"
  route53_zone_id = "your-route53-zone-id"
}
```

## Complete Example with SES Logging Enabled
```hcl
module "ses" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-ses.git"

  domain              = "example.com"
  cloudflare_zone_id  = "your-cloudflare-zone-id"
  enable_ses_logging  = true
  
  # Optional: Configure logging settings
  feedback_notification_type = ["Bounce", "Complaint", "Delivery"]
  ses_logs_retention_period  = var.env == "prod" ? 90 : 30
}
```
