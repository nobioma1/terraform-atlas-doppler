variable "project_name" {
  type        = string
  description = "project name"
  default     = "atlas-monogo-project"
}

variable "project_environment" {
  type        = string
  description = "project environment to be created"
  default     = "development"
}

variable "atlas_cluster_instance_size_name" {
  type        = string
  description = "MongoDb Atlas cluster instance size"

  # M0 - "INVALID_ENUM_VALUE"
  # https://github.com/mongodb/mongodbatlas-cloudformation-resources/issues/22
  default     = "M0" # Free tier 
}

variable "atlas_provider_name" {
  type        = string
  description = "MongoDb Atlas cloud provider"
  default     = "AWS"
}

variable "atlas_region" {
  type        = string
  description = "MongoDb Atlas region where resources will be created"
  default     = "EU_WEST_1" # EU - Ireland
}

variable "doppler_token" {
  type        = string
  description = "A token to authenticate with Doppler"
}

