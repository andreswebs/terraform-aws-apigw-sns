module "apigw_sns" {
  source                     = "github.com/andreswebs/terraform-aws-apigw-sns"
  api_name                   = "example-notifications"
  api_title                  = "example-notifications"
  topic_name                 = "example-notifications"
  ssm_parameter_name_url     = "/webhook/url"
  ssm_parameter_name_api_key = "/webhook/api-key"
}