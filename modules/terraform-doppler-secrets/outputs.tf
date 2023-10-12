output "mongodb_atlas_org_id" {
  value = data.doppler_secrets.this.map.MONGODB_ATLAS_ORG_ID
}

output "mongodb_atlas_public_key" {
  value = data.doppler_secrets.this.map.MONGODB_ATLAS_PUBLIC_KEY
}

output "mongodb_atlas_private_key" {
  value     = data.doppler_secrets.this.map.MONGODB_ATLAS_PRIVATE_KEY
  sensitive = true
}

output "mongodb_atlas_user_username" {
  value = data.doppler_secrets.this.map.MONGODB_ATLAS_USER_USERNAME
}

output "mongodb_atlas_user_password" {
  value     = data.doppler_secrets.this.map.MONGODB_ATLAS_USER_PASSWORD
  sensitive = true
}

output "environment" {
  value = data.doppler_secrets.this.map.ENVIRONMENT
}