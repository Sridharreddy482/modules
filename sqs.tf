resource "aws_sqs_queue" "amazon_queue" {
  name      = var.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:${var.name}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.sqs_notification_bucket.arn}" }
      }
    }
  ]
}
POLICY

  tags = {
    Environment = var.Environment
  }
}

resource "aws_s3_bucket" "sqs_notification_bucket" {
  bucket =  var.bucketName
  tags = {
      Environment = var.Environment
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.sqs_notification_bucket.id
    queue {
    queue_arn     = aws_sqs_queue.amazon_queue.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}