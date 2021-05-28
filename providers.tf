# --- provider/file ---
provider "aws" {
  default_tags {
    tags = {
      Enviroment = "Development"
      Owner      = "GrandBanco"
      Project    = "VPC-Peering"
    }
  }
  region = "us-west-2"
}
