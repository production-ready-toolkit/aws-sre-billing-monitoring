resource "aws_cloudwatch_metric_alarm" "anomaly" {
  alarm_name          = format("%s-aws-billing-%s-anomaly-detection", var.project, var.environment)
  comparison_operator = "GreaterThanUpperThreshold"
  evaluation_periods  = 1
  datapoints_to_alarm = 1
  threshold_metric_id = "e1"

#   alarm_actions = [
#     var.sns_topic_warn == null ? aws_sns_topic.danger[0].arn : var.sns_topic_danger
#   ]

  metric_query {
    id          = "m1"
    return_data = true

    metric {
      metric_name = "EstimatedCharges"
      namespace   = "AWS/Billing"
      period      = "21600"
      stat        = "Maximum"
      dimensions = {
        Currency        = lookup(var.danger, "Currency")
        LinkedAccount   = var.linked_account
      }
    }
  }

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1, 1)"
    label       = "EstimatedCharges (Expected)"
    return_data = "true"
  }

  tags = var.tags
}
