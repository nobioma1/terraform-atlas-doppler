terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.12.1"
    }

    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.3.0"
    }
  }

  required_version = ">= 0.13"
}

module "doppler_secrets" {
  source = "./modules/terraform-doppler-secrets"

  doppler_token = var.doppler_token
}

locals {
  global_env = coalesce(module.doppler_secrets.environment, var.project_environment)
}

module "atlas-mongodb" {
  source = "./modules/terraform-atlas-mongodb"

  atlas_project_environment        = local.global_env
  atlas_access_public_key          = module.doppler_secrets.mongodb_atlas_public_key
  atlas_access_private_key         = module.doppler_secrets.mongodb_atlas_private_key
  atlas_org_id                     = module.doppler_secrets.mongodb_atlas_org_id
  atlas_project_name               = var.project_name
  atlas_provider_name             = var.atlas_provider_name
  atlas_cluster_instance_size_name = var.atlas_cluster_instance_size_name
  atlas_region                     = var.atlas_region
  atlas_cidr_block                 = "0.0.0.0/0"   #Allow access from anywhere

  mongodb_user_username = module.doppler_secrets.mongodb_atlas_user_username
  mongodb_user_password = module.doppler_secrets.mongodb_atlas_user_password
}

