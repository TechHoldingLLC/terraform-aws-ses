####################
#  ses/route53.tf  #
####################

resource "aws_route53_record" "ses_dkim_record" {
  count = length(var.route53_zone_id) > 0 ? 3 : 0

  zone_id = var.route53_zone_id
  name    = "${aws_ses_domain_dkim.ses_dkim.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.ses_dkim.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_route53_record" "ses_dmarc_record" {
  count = length(var.route53_zone_id) > 0 ? 1 : 0

  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.${var.domain}"
  type    = "TXT"
  ttl     = "600"
  records = ["v=DMARC1;p=none"]
}

# Domain Mail From Route53 MX record
resource "aws_route53_record" "bounce_ses_domain_mail_from_mx" {
  count = length(var.route53_zone_id) > 0 ? 1 : 0

  zone_id = var.route53_zone_id
  name    = aws_ses_domain_mail_from.bounce.mail_from_domain
  type    = "MX"
  ttl     = "600"
  records = ["10 feedback-smtp.${local.region}.amazonses.com"]
}

# Domain Mail From Route53 TXT record for SPF
resource "aws_route53_record" "bounce_ses_domain_mail_from_txt" {
  count = length(var.route53_zone_id) > 0 ? 1 : 0

  zone_id = var.route53_zone_id
  name    = aws_ses_domain_mail_from.bounce.mail_from_domain
  type    = "TXT"
  ttl     = "600"
  records = ["v=spf1 include:amazonses.com -all"]
}
