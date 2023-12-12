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

    invoke = <<-CMD
      API_KEY=$(
        aws ssm get-parameter \
            --name ${aws_ssm_parameter.api_key.name} \
            --with-decryption \
            --query 'Parameter.Value' \
            --output text | tr -d '[:space:]'
      )
      INVOKE_URL="${aws_api_gateway_stage.this.invoke_url}"
      curl \
          --location \
          --header 'Content-Type: application/json' \
          --header "X-Api-Key: $API_KEY" \
          --data-raw '{ "TestMessage": "Hello From ApiGateway!" }' \
          --request POST \
          "$INVOKE_URL/${var.api_path}"
    CMD


  }
}
