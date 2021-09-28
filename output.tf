output "sns_warn" {
    value = aws_sns_topic.warn
}

output "sns_danger" {
    value = aws_sns_topic.danger
}

output "cloudwatch_warn_alarm" {
    value = aws_cloudwatch_metric_alarm.warn
}

output "cloudwatch_warn_danger" {
    value = aws_cloudwatch_metric_alarm.danger
}