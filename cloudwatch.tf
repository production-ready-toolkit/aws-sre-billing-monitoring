resource "aws_cloudwatch_metric_alarm" "warn" {
    alarm_name  = format("%s-aws-billing-%s-warn", var.project, var.environment)
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "EstimatedCharges"
    namespace           = "AWS/Billing"
    period              = "21600"
    statistic           = "Maximum"

    alarm_actions       = [
        var.sns_topic_warn == null ? aws_sns_topic.warn[0].arn : var.sns_topic_warn
    ]

    dimensions = {
        Currency        = lookup(var.warn, "Currency")
    }

    threshold           = lookup(var.warn, "Amount")

    tags                = var.tags
}

resource "aws_cloudwatch_metric_alarm" "danger" {
    alarm_name  = format("%s-aws-billing-%s-danger", var.project, var.environment)
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "EstimatedCharges"
    namespace           = "AWS/Billing"
    period              = "21600"
    statistic           = "Maximum"

    alarm_actions       = [
        var.sns_topic_warn == null ? aws_sns_topic.danger[0].arn : var.sns_topic_danger
    ]

    dimensions = {
        Currency        = lookup(var.danger, "Currency")
    }

    threshold           = lookup(var.danger, "Amount")

    tags                = var.tags
}