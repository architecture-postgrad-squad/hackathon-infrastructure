resource "aws_sqs_queue" "videos_queue" {
  name                      = "sqs-videos"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds             = 0
  max_message_size          = 262144
  receive_wait_time_seconds = 0
}
