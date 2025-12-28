locals{
	cachingOptimized = data.aws_cloudfront_cache_policy.cachingOptimized.value
	cachingDisabled = data.aws_cloudfront_cache_policy.cachingDisabled.value
	cdn_certificate_arn = data.aws_ssm_parameter.certificate_arn
	common_tags = {
		Project = var.project_name
		Environment = var.environment
		Terraform = "true"
	}
}