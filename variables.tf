variable name {
  type        = string
  default     = "sqsQueue"
  description = "Name of the messaging queue"
}

variable Environment {
    type  = string
    default = ""
    description = "Environment"
}

variable bucketName {
    type = string
    default = "s3-sqs-notification-bucket"
    description = "notification bucket to configure to SQS queue"
}