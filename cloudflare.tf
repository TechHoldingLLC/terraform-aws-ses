#######################
#  ses/cloudflare.tf  #
#######################

resource "cloudflare_record" "ses_dkim_record" {
  count = length(var.cloudflare_zone_id) > 0 ? 3 : 0

  zone_id = var.cloudflare_zone_id
  name    = "${aws_ses_domain_dkim.ses_dkim.dkim_tokens[count.index]}._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = "600"
  content = "${aws_ses_domain_dkim.ses_dkim.dkim_tokens[count.index]}.dkim.amazonses.com"
}

resource "cloudflare_record" "ses_dmarc_record" {
  count = length(var.cloudflare_zone_id) > 0 ? 1 : 0

  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.${var.domain}"
  type    = "TXT"
  ttl     = "600"
  content = "\"v=DMARC1;p=none\""
}

# Domain Mail From Cloudflare MX record
resource "cloudflare_record" "bounce_ses_domain_mail_from_mx" {
  count = length(var.cloudflare_zone_id) > 0 ? 1 : 0

  zone_id  = var.cloudflare_zone_id
  name     = aws_ses_domain_mail_from.bounce.mail_from_domain
  type     = "MX"
  ttl      = "600"
  content  = "feedback-smtp.${local.region}.amazonses.com"
  priority = 10
}

# Domain Mail From Cloudflare TXT record for SPF
resource "cloudflare_record" "bounce_ses_domain_mail_from_txt" {
  count = length(var.cloudflare_zone_id) > 0 ? 1 : 0

  zone_id = var.cloudflare_zone_id
  name    = aws_ses_domain_mail_from.bounce.mail_from_domain
  type    = "TXT"
  ttl     = "600"
  content = "\"v=spf1 include:amazonses.com -all\""
}
