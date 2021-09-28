# Billing Alerts Module for SRE's 

# Features by Default

* Danger Threshold 
* Warning Threashold
* SNS Topics to Notifications

# Variables 

| Variable              | Default       | Required  | Type      |  Additional Info      |
|-----------------------|---------------|-----------|-----------|-----------------------|
| `project`             | NA            | yes       | `string`  |                       |   
| `environment`         | NA            | yes       | `string`  |                       |
| `sns_topic_warn `     | `null`        | no        | `string`  | A new will be created |
| `sns_topic_danger`    | `null`        | no        | `string`  | A new will be created |
| `evaluation_period`   | `21600`       | no        | `string`  |                       |
| `linked_account`      | `null`        | no        | `string`  |                       |
| `warn.Currency`       | `USD`         | no        | `string`  |                       |
| `warn.Amount`         | `5.00`        | no        | `string`  |                       |
| `danger.Currency`     | `USD`         | no        | `string`  |                       |
| `danger.Amount`       | `15.00`       | no        | `string`  |                       |

# Outputs 

| Variable                  | Value                                 |
|---------------------------|---------------------------------------|
| `sns_warn`                | `aws_sns_topic.warn`                  | 
| `sns_danger`              | `aws_sns_topic.danger`                | 
| `cloudwatch_warn_alarm`   | `aws_cloudwatch_metric_alarm.warn`    | 
| `cloudwatch_warn_danger`  | `aws_cloudwatch_metric_alarm.danger`  | 

# Usage 

```hcl
module "basic_alert" {
    source = "github.com/production-ready-toolkit/aws-sre-billing-monitoring"

    project     = "dummy"
    environment = "prod"

    warn        = {
      Currency = "USD"
      Amount   = "10.00"
    }

    danger      = {
      Currency = "USD"
      Amount   = "20.00"
    }


    tags        = {
        "environment" = "production"
    }
}
```

# Examples

# Todo 

* ...
