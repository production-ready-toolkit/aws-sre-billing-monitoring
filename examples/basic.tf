module "basic_alert" {
    # source = "github.com/production-ready-toolkit/aws-sre-billing-monitoring"

    source = "../"

    project     = "dummy"
    environment = "prod"

    warn        = {
      Currency = "USD"
      Amount   = "20.00"
    }

    danger      = {
      Currency = "USD"
      Amount   = "50.00"
    }


    tags        = {
        "environment" = "production"
    }
}