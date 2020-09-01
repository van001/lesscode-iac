resource "aws_cloudfront_distribution" "default" {
  origin {
    domain_name = var.alb_dns_name
    origin_id   = var.alb_dns_name
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = ""

  

  aliases = [var.domain]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["HEAD"]
    target_origin_id = var.alb_dns_name

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  tags = {
    Environment = var.env
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}