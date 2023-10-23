resource "aws_cognito_user_pool" "pool" {
  name                = "cognito-pool"
  username_attributes = ["email"]
  mfa_configuration   = "OFF"

  schema {
    name                = "name"
    attribute_data_type = "String"
    required            = true

    string_attribute_constraints {
      min_length = 2
      max_length = 100
    }
  }

  software_token_mfa_configuration {
    enabled = false
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  password_policy {
    minimum_length                   = 8
    require_lowercase                = false
    require_numbers                  = false
    require_symbols                  = false
    require_uppercase                = false
    temporary_password_validity_days = 365
  }

  username_configuration {
    case_sensitive = false
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name                  = "cognito-pool-client"
  generate_secret       = false
  explicit_auth_flows   = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_ADMIN_USER_PASSWORD_AUTH"]
  auth_session_validity = 15

  user_pool_id = aws_cognito_user_pool.pool.id
}
