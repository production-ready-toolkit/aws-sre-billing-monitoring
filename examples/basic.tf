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