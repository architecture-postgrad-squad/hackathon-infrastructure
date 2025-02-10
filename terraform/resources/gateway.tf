resource "aws_api_gateway_rest_api" "api-gw" {
  name        = "api-gw"
  description = "API Gateway Hackathon"
}

resource "aws_api_gateway_resource" "auth_resource" {
  rest_api_id = aws_api_gateway_rest_api.api-gw.id
  parent_id   = aws_api_gateway_rest_api.api-gw.root_resource_id
  path_part   = "auth" 
}

resource "aws_api_gateway_method" "my_method" {
  rest_api_id   = aws_api_gateway_rest_api.api-gw.id
  resource_id   = aws_api_gateway_resource.auth_resource.id
  http_method   = "GET" 
  authorization = "NONE" 
}
//TODO: configure eks cluster