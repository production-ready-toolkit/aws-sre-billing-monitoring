# XXXXXXXXXX Module for SRE's 

# Features by Default

* Encryption at rest
* Automatic Failover
* Multi-AZ 

# Variables 

| Variable                      | Default       | Required  | Type      |  Additional Info  |
|-------------------------------|---------------|-----------|-----------|-------------------|
| `name`                        | NA            | yes       | `string`  |                   |   
| `vpc`                         | NA            | yes       | `string`  | VPC ID            |
| `subnets `                    | NA            | yes       | `list`    | Subnet ID's       |
| `tags`                        | `{}`          | no        | `map(any)`| Tags to resources  |


# Outputs 

| Variable                      | Value                                     |
|-------------------------------|-------------------------------------------|
| `parameter_group`             | `aws_elasticache_parameter_group.main`    | 
| `security_group`              | `security_group`                          | 

# Usage 

```hcl
module "dummy" {
    source = "github.com/production-ready-toolkit/terraform-module-boilerplate"

    name        = "dummy"

    vpc         = "vpc-ba8b92c1"

    subnets     = [
        "subnet-1198752f",
        "subnet-c832eeaf",
        "subnet-f634adf9"
    ]

    tags        = {
        "environment" = "production"
    }
}
```

# Examples

# Todo 

* ...