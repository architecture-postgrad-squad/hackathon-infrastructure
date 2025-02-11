resource "aws_cognito_user_pool" "example" {
  name             = "example-user-pool"
  username_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  mfa_configuration = "OFF" 
  auto_verified_attributes = ["email"]

   
  schema {
    name                 = "temporary_password"
    attribute_data_type  = "String"   
    mutable              = true     
    required             = false    
  }
}

resource "aws_cognito_user_pool_client" "example_client" {
  name         = "example-client"
  user_pool_id = aws_cognito_user_pool.example.id

  generate_secret = false

   explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH", 
    "ALLOW_REFRESH_TOKEN_AUTH"  
  ]
}

resource "aws_cognito_user" "example_user" {
  username = "example@example.com"
  user_pool_id = aws_cognito_user_pool.example.id
  attributes = {
    email = "example@example.com"
    given_name = "Example"
    "temporary_password" = "1234567890"
  }
}