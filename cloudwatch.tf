resource "aws_cloudwatch_metric_alarm" "warn" {
    alarm_name  = format("%s-aws-billing-%s-warn", var.project, var.environment)
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "EstimatedCharges"
    namespace           = "AWS/Billing"
    period              = var.evaluation_period
    statistic           = "Maximum"

    alarm_actions       = [
        var.sns_topic_warn == null ? aws_sns_topic.warn[0].arn : var.sns_topic_warn
    ]

    dimensions = {
        Currency        = lookup(var.warn, "Currency")
        LinkedAccount   = var.linked_account
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
    period              = var.evaluation_period
    statistic           = "Maximum"

    alarm_actions       = [
        var.sns_topic_warn == null ? aws_sns_topic.danger[0].arn : var.sns_topic_danger
    ]

    dimensions = {
        Currency        = lookup(var.danger, "Currency")
        LinkedAccount   = var.linked_account
    }

    threshold           = lookup(var.danger, "Amount")

    tags                = var.tags
}