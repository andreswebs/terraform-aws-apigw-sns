output "info" {
  value = {
    invoke_url = module.apigw_sns.invoke_url
    test_cmd   = module.apigw_sns.test_cmd
    oas        = module.apigw_sns.openapi_spec
  }
}
