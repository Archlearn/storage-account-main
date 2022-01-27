storage_name                      = "adp"
environment                       = "dev"
resource_group_name               = "adp-dev"
location                          = "East US"
min_tls_version                   = "TLS1_2"
enable_advanced_threat_protection = true
containers = [
  {
    name        = "adp-container"
    access_type = "private"
  }
]

cors_rule = []

lifecycles = []
tags = {
  environment = "dev"
}

