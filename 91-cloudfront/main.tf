resource "aws_cloudfront_distribution" "roboshop" {
    origin {
        domain_name  = "${var.project_name}-${var.environment}.${var.domain_name}" # roboshop-dev.daws96s.fun
        origin_id    = "${var.project_name}-${var.environment}.${var.domain_name}"
        custom_origin_config {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "https-only"
            origin_ssl_protocols = ["TLSv1.2"]
        }
    }

    enabled      = true
    aliases = ["${var.project_name}-${var.environment}"]  # roboshop-dev

    default_cache_behavior {
            allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
            cached_methods   = ["GET", "HEAD"]
            # target_origin_id tells CloudFront which origin to send the request to.
	        # When a request comes, send it to the room named
            target_origin_id = "${var.project_name}-${var.environment}.${var.domain_name}" 
            viewer_protocol_policy = "https-only"
            cache_policy_id = local.cachingDisabled
    }

    # Cache behavior with precedence 0
    ordered_cache_behavior {
        path_pattern     = "/media/*"
        allowed_methods  = ["GET", "HEAD", "OPTIONS"]
        cached_methods   = ["GET", "HEAD", "OPTIONS"]
        target_origin_id = "${var.project_name}-${var.environment}.${var.domain_name}" 
        viewer_protocol_policy = "https-only"
        cache_policy_id = local.cachingOptimized
    }

    # Cache behavior with precedence 1
    ordered_cache_behavior {
        path_pattern     = "/image/*"
        allowed_methods  = ["GET", "HEAD", "OPTIONS"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "${var.project_name}-${var.environment}.${var.domain_name}" 
        viewer_protocol_policy = "https-only"
        cache_policy_id = local.cachingOptimized
    }

    # PriceClass_All means allows overall edge cache like all locations
    price_class = "PriceClass_All"

    restrictions {
        geo_restriction {
        restriction_type = "whitelist"
        locations        = ["US", "IN", "TH", "DE"]
        }
    }

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}"  # roboshop-dev
        }
    )

    viewer_certificate {
        acm_certificate_arn = local.cdn_certificate_arn
        ssl_support_method  = "sni-only"
        # The user will tell the website name, and CloudFront will use the correct SSL lock for that website.
	    # SNI lets CloudFront know which SSL certificate to use for your website.
    }
}

resource "aws_route53_record"  "cdn" {
    zone_id          = var.zone_id
    name             = "${var.environment}.${var.domain_name}" # dev.daws96s.fun
    type             = "A"
    allow_overwrite  =  true

    alias {
      name                    = aws_cloudfront_distribution.roboshop.domain_name
      zone_id                 = aws_cloudfront_distribution.roboshop.hosted_zone_id
      evaluate_target_health  = true
    }

}

