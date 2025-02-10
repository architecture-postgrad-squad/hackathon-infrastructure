resource "aws_dynamodb_table" "video-process-table" {
  name           = "video-process-table"
  billing_mode   = "PAY_PER_REQUEST"

  hash_key       = "id"
  range_key      = "timestamp"

 attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "S" 
  }

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "ProcessId"
    type = "S"
  }

  global_secondary_index {
    name               = "UserId-index"
    hash_key           = "UserId"
    projection_type    = "ALL" 
  }

  global_secondary_index {
    name               = "ProcessId-index"
    hash_key           = "ProcessId"
    projection_type    = "ALL" 
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }
}