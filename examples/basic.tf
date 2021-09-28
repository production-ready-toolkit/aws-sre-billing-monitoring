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