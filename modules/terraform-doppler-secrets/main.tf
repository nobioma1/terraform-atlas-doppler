# Configure the Doppler provider with the token
provider "doppler" {
  doppler_token = var.doppler_token
}

# define data source to fetch secrets
data "doppler_secrets" "this" {}