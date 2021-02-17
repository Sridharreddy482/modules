output name {
  value       = aws_sqs_queue.amazon_queue.arn
}

output test {
  value       = aws_s3_bucket.sqs_notification_bucket.arn
}

