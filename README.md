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
| `warn.Currency`       | `USD`         | no        | `string`  |                       |
| `warn.Currency`       | `5.00`        | no        | `string`  |                       |
| `danger.Currency`     | `USD`         | no        | `string`  |                       |
| `danger.Currency`     | `15.00`       | no        | `string`  |                       |

# Outputs 

| Variable                  | Value                                 |
|---------------------------|---------------------------------------|
| `sns_warn`                | `aws_sns_topic.warn`                  | 
| `sns_danger`              | `aws_sns_topic.danger`                | 
| `cloudwatch_warn_alarm`   | `aws_cloudwatch_metric_alarm.warn`    | 
| `cloudwatch_warn_danger`  | `aws_cloudwatch_metric_alarm.danger`  | 

# Usage 

```hcl
module "dummy" {
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