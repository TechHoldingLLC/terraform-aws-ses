## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_ses_logging"></a> [lambda\_ses\_logging](#module\_lambda\_ses\_logging) | git::https://github.com/TechHoldingLLC/terraform-aws-lambda-function.git | v1.0.11 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.bounce_ses_domain_mail_from_mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.bounce_ses_domain_mail_from_txt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ses_dkim_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ses_dmarc_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_dkim.ses_dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.ses_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_mail_from.bounce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from) | resource |
| [aws_ses_identity_notification_topic.ses](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_identity_notification_topic) | resource |
| [aws_sns_topic.ses_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [cloudflare_record.bounce_ses_domain_mail_from_mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.bounce_ses_domain_mail_from_txt](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.ses_dkim_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.ses_dmarc_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | CloudFlare zone id | `string` | `""` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name for domain identity | `string` | n/a | yes |
| <a name="input_enable_ses_logging"></a> [enable\_ses\_logging](#input\_enable\_ses\_logging) | Enable SES logging | `bool` | `false` | no |
| <a name="input_feedback_notification_type"></a> [feedback\_notification\_type](#input\_feedback\_notification\_type) | Feedback notification type, valid values are Bounce, Complaint, Delivery | `list(string)` | <pre>[<br/>  "Bounce",<br/>  "Complaint",<br/>  "Delivery"<br/>]</pre> | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Route53 zone id | `string` | `""` | no |
| <a name="input_ses_logs_retention_period"></a> [ses\_logs\_retention\_period](#input\_ses\_logs\_retention\_period) | SES logs retention period | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the domain identity |
| <a name="output_domain"></a> [domain](#output\_domain) | Name of the domain identity |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-ses/blob/main/LICENSE) for full details.
