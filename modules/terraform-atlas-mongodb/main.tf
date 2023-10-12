# Initialize Atlas provider 
provider "mongodbatlas" {
  public_key  = var.atlas_access_public_key
  private_key = var.atlas_access_private_key
}

# Create an Atlas project
resource "mongodbatlas_project" "atlas-atlas-monogo-project" {
  org_id = var.atlas_org_id
  name   = var.atlas_project_name
}

resource "mongodbatlas_advanced_cluster" "atlas-atlas-monogo-project-cluster" {
  name           = "${var.atlas_project_name}-${var.atlas_project_environment}-cluster"
  project_id     = mongodbatlas_project.atlas-atlas-monogo-project.id
  cluster_type   = "REPLICASET"
  backup_enabled = false

  replication_specs {
    region_configs {
      provider_name = var.atlas_provider_name
      region_name   = var.atlas_region
      priority      = 7

      electable_specs {
        instance_size = var.atlas_cluster_instance_size_name
      }
    }
  }
}

# Create database user
resource "mongodbatlas_database_user" "db-user" {
  username           = var.mongodb_user_username
  password           = var.mongodb_user_password
  project_id         = mongodbatlas_project.atlas-atlas-monogo-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-db"
  }
}

# Create database IP Access List 
resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.atlas-atlas-monogo-project.id
  cidr_block = var.atlas_cidr_block
}