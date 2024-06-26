output "topic" {
  description = "The `aws_sns_topic` resource"
  value       = aws_sns_topic.this
}

output "api" {
  description = "The `aws_api_gateway_rest_api` resource"
  value       = aws_api_gateway_rest_api.this
}

output "api_stage" {
  description = "The `aws_api_gateway_stage` resource"
  value       = aws_api_gateway_stage.this
}

output "invoke_url" {
  description = "The API Gateway invocation URL"
  value       = aws_api_gateway_stage.this.invoke_url
}

output "api_key" {
  description = "The `aws_api_gateway_api_key` resource"
  value       = aws_api_gateway_api_key.this
}

output "openapi_spec" {
  description = "The OpenAPI spec"
  value       = local.openapi_spec
}

output "test_cmd" {
  description = "Commands to test the integration"
  value = {

    invoke = templatefile("${path.module}/tpl/invoke.sh.tftpl", {
      api_key_enabled    = var.api_key_enabled
      api_key_param_name = var.api_key_enabled ? aws_ssm_parameter.api_key[0].name : null
      api_path           = var.api_path
      invoke_url         = aws_api_gateway_stage.this.invoke_url
      test_message       = "Hello from ApiGateway!"
    })

  }
}
