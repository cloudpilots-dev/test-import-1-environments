# dev environment
module "env-dev" {
  source          = "git::https://github.com/cloudpilots-dev/tf-module-environment"
  environment     = "dev"
  billing_account = var.billing_account
  dns_domain      = var.dns_domain
  domain          = var.domain
  folder_id       = var.folder_id
  name            = var.name
  project_suffix  = var.project_suffix
  parent_repo     = var.parent_repo
  bucket_name     = var.bucket_name
}

# prod environment
module "env-prod" {
  source          = "git::https://github.com/cloudpilots-dev/tf-module-environment"
  environment     = "prod"
  billing_account = var.billing_account
  dns_domain      = var.dns_domain
  domain          = var.domain
  folder_id       = var.folder_id
  name            = var.name
  project_suffix  = var.project_suffix
  parent_repo     = var.parent_repo
  bucket_name     = var.bucket_name
  recordsets = [
    # {
    #   name    = "custom"
    #   type    = "NS"
    #   ttl     = 300
    #   records = module.env-custom.dns_zone_name_servers
    # },
    # {
    #   name    = "sandbox"
    #   type    = "NS"
    #   ttl     = 300
    #   records = module.env-sandbox.dns_zone_name_servers
    # },
    # {
    #   name    = "qa"
    #   type    = "NS"
    #   ttl     = 300
    #   records = module.env-qa.dns_zone_name_servers
    # },
    # {
    #   name    = "demo"
    #   type    = "NS"
    #   ttl     = 300
    #   records = module.env-demo.dns_zone_name_servers
    # },
    {
      name    = "dev"
      type    = "NS"
      ttl     = 300
      records = module.env-dev.dns_zone_name_servers
    }
  ]
}

# demo environment
# module "env-demo" {
#   source          = "git::https://github.com/cloudpilots-dev/tf-module-environment.git?ref=master"
#   environment     = "demo1" 
#   billing_account = var.billing_account
#   dns_domain      = var.dns_domain
#   domain          = var.domain
#   folder_id       = var.folder_id
#   name            = var.name
#   project_suffix  = var.project_suffix
#   parent_repo     = var.parent_repo
# }

# qa environment
# module "env-qa" {
#   source          = "git::https://github.com/cloudpilots-dev/tf-module-environment.git?ref=master"
#   environment     = "qa"
#   billing_account = var.billing_account
#   dns_domain      = var.dns_domain
#   domain          = var.domain
#   folder_id       = var.folder_id
#   name            = var.name
#   project_suffix  = var.project_suffix
#   parent_repo     = var.parent_repo
#   bucket_name     = var.bucket_name
# }

# sandbox environment
# module "env-sandbox" {
#   source          = "git::https://github.com/cloudpilots-dev/tf-module-environment.git?ref=master"
#   environment     = "sandbox"
#   billing_account = var.billing_account
#   dns_domain      = var.dns_domain
#   domain          = var.domain
#   folder_id       = var.folder_id
#   name            = var.name
#   project_suffix  = var.project_suffix
#   parent_repo     = var.parent_repo
#   bucket_name     = var.bucket_name
# }

# custom environment
# module "env-custom" {
#   source          = "git::https://github.com/cloudpilots-dev/tf-module-environment.git?ref=master"
#   environment     = "custom"
#   billing_account = var.billing_account
#   dns_domain      = var.dns_domain
#   domain          = var.domain
#   folder_id       = var.folder_id
#   name            = var.name
#   project_suffix  = var.project_suffix
#   parent_repo     = var.parent_repo
#   bucket_name     = var.bucket_name
# }


