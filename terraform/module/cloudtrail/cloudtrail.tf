resource "aws_cloudtrail" "example" {
  name           = "terraform-example-cloud-trail"
  s3_bucket_name = aws_s3_bucket.logs.id
  enable_logging = true

  // Scope
  include_global_service_events = true
  is_multi_region_trail         = true
  event_selector {
    include_management_events = true
  }

  // Logs Validation
  enable_log_file_validation = true

  // Anomaly detection
  insight_selector {
    insight_type = "ApiCallRateInsight"
  }
}
