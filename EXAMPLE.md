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

## Complete Example with SNS Topic
```hcl
resource "aws_sns_topic" "ses_notifications" {
  name = "ses-notifications"
}

module "ses" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-ses.git"

  domain             = "example.com"
  cloudflare_zone_id = "your-cloudflare-zone-id"
  sns_topic_arn      = aws_sns_topic.ses_notifications.arn

  depends_on = [aws_sns_topic.ses_notifications]
}
```