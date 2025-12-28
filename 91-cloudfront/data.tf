data "aws_cloudfront_cache_policy" "cachingOptimized" {
    name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "cachingDisabled" {
    name = "Managed-CachingDisabled"
}

# *daws96s.fun
data "aws_ssm_parametr" "certificate_arn"{
	name = "/${var.project_name}/${var.environment}/certificate_arn"
}
