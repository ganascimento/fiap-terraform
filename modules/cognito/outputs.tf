output "user_pool_endpoint" {
  value = aws_cognito_user_pool.pool.endpoint
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.client.id
}
