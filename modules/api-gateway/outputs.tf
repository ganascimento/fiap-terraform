output "apigateway_id" {
  value = aws_apigatewayv2_api.main.id
}

output "apigateway_execution_arn" {
  value = aws_apigatewayv2_api.main.execution_arn
}
