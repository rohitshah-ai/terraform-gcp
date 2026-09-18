environment = "dev"
project_id  = "ai-powered-invoice-507413"

region          = "us-central1"
cloudsql_region = "us-central1"

database_name     = "invoice-db"
database_username = "admin"

vpc_name    = "aip-invoice-vpc-dev"
subnet_name = "aip-invoice-subnet-dev"
subnet_cidr = "10.10.0.0/24"

bgp_routing_mode             = "REGIONAL"
bgp_best_path_selection_mode = "LEGACY"
