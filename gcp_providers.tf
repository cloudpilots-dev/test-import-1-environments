# provider configuration
provider "google" {
  credentials = file("../cpl-demo-terraform-a279b3d16ccb.json")
  version     = "~> 3.6.0"
  region      = "europe-west3"
  zone        = "europe-west3-b"
}

provider "google-beta" {
  credentials = file("../cpl-demo-terraform-a279b3d16ccb.json")
  version     = "~> 3.6.0"
  region      = "europe-west3"
  zone        = "europe-west3-b"
}

provider "null" {
  version = "~> 2.1"
}

provider "random" {
  version = "~> 2.2"
}
