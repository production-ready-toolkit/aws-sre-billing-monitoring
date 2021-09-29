resource "aws_sns_topic" "warn" {
  count = var.sns_topic_warn == null ? 1 : 0
  name  = format("%s-aws-billing-%s-warn", var.project, var.environment)

  tags = var.tags
}

resource "aws_sns_topic" "danger" {
  count = var.sns_topic_danger == null ? 1 : 0
  name  = format("%s-aws-billing-%s-danger", var.project, var.environment)

  tags = var.tags
}

resource "aws_sns_topic" "anomaly" {
  count = var.sns_topic_anomaly_detection == null ? 1 : 0
  name  = format("%s-aws-billing-%s-anomaly-detection", var.project, var.environment)

  tags = var.tags
}