# terraform-aws-apigw-sqs

Create an API Gateway endpoint that publishes to an SNS topic.

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "apigw_sns" {
  source                     = "github.com/andreswebs/terraform-aws-apigw-sns"
  api_name                   = "example-notifications"
  api_title                  = "example-notifications"
  topic_name                 = "example-notifications"
  ssm_parameter_name_url     = "/webhook/url"
  ssm_parameter_name_api_key = "/webhook/api-key"
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_enabled"></a> [api\_key\_enabled](#input\_api\_key\_enabled) | Whether to enable API key | `bool` | `true` | no |
| <a name="input_api_key_name"></a> [api\_key\_name](#input\_api\_key\_name) | The name of the API Gateway key | `string` | `"default"` | no |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | The API name in API Gateway | `string` | `"webhook"` | no |
| <a name="input_api_path"></a> [api\_path](#input\_api\_path) | (optional) The API path | `string` | `"/"` | no |
| <a name="input_api_stage_name"></a> [api\_stage\_name](#input\_api\_stage\_name) | The name of the API Gateway stage | `string` | `"default"` | no |
| <a name="input_api_title"></a> [api\_title](#input\_api\_title) | The `info.title` value in the OpenAPI spec | `string` | `"webhook"` | no |
| <a name="input_api_usage_plan_name"></a> [api\_usage\_plan\_name](#input\_api\_usage\_plan\_name) | The name of the API Gateway usage plan | `string` | `"default"` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Log retention in days | `number` | `30` | no |
| <a name="input_ssm_parameter_name_api_key"></a> [ssm\_parameter\_name\_api\_key](#input\_ssm\_parameter\_name\_api\_key) | The name of the SSM parameter to store the API key | `string` | `"/webhook/api-key"` | no |
| <a name="input_ssm_parameter_name_url"></a> [ssm\_parameter\_name\_url](#input\_ssm\_parameter\_name\_url) | The name of the SSM parameter to store the webhook URL | `string` | `"/webhook/url"` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | The topic name | `string` | `"webhook"` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api"></a> [api](#output\_api) | The `aws_api_gateway_rest_api` resource |
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | The `aws_api_gateway_api_key` resource |
| <a name="output_api_stage"></a> [api\_stage](#output\_api\_stage) | The `aws_api_gateway_stage` resource |
| <a name="output_invoke_url"></a> [invoke\_url](#output\_invoke\_url) | The API Gateway invocation URL |
| <a name="output_openapi_spec"></a> [openapi\_spec](#output\_openapi\_spec) | The OpenAPI spec |
| <a name="output_test_cmd"></a> [test\_cmd](#output\_test\_cmd) | Commands to test the integration |
| <a name="output_topic"></a> [topic](#output\_topic) | The `aws_sns_topic` resource |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_api_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_api_key) | resource |
| [aws_api_gateway_deployment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_method_settings.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_rest_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_api_gateway_usage_plan.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan) | resource |
| [aws_api_gateway_usage_plan_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan_key) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.apigw_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.apigw_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_ssm_parameter.api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.apigw_access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.apigw_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.apigw_service_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
