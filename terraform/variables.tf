variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "${AWS_REGION}"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "clipped-images"
}

variable "access_key" {
  description = "AWS access key"
  type        = string
  default     = "${AWS_ACCESS_KEY}"
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = "${AWS_SECRET_KEY}"
}

variable "token" {
  description = "AWS token"
  type        = string
  default     = "${AWS_SECRET_TOKEN}"
}