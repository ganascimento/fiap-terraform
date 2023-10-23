resource "aws_apigatewayv2_integration" "auth_lambda" {
  api_id             = var.apigateway_id
  integration_uri    = aws_lambda_function.auth_lambda.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "post_auth" {
  api_id    = var.apigateway_id
  route_key = "POST /auth"
  target    = "integrations/${aws_apigatewayv2_integration.auth_lambda.id}"
}

resource "aws_lambda_permission" "api_gw_auth_lambda" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.auth_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.apigateway_execution_arn}/*/*"
}
