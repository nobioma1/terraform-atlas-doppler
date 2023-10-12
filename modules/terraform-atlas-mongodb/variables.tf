variable "atlas_access_public_key" {
  type        = string
  description = "MongoDb Atlas organization access public key"
}

variable "atlas_access_private_key" {
  type        = string
  description = "MongoDb Atlas organization access private key"
}

variable "atlas_org_id" {
  type        = string
  description = "MongoDb Atlas organization ID"
}

variable "atlas_project_name" {
  type        = string
  description = "MongoDb Atlas project name"
}

variable "atlas_project_environment" {
  type        = string
  description = "MongoDb Atlas project environment to be created"
}

variable "atlas_cluster_instance_size_name" {
  type        = string
  description = "MongoDb Atlas cluster instance size"
}

variable "atlas_provider_name" {
  type        = string
  description = "MongoDb Atlas cloud provider"
}

variable "atlas_region" {
  type        = string
  description = "MongoDb Atlas region where resources will be created"
}

variable "atlas_cidr_block" {
  type        = string
  description = "Range of IP addresses in CIDR notation"
}

variable "mongodb_version" {
  type        = string
  description = "MongoDB Version"
  default     = "6.0"
}

variable "mongodb_user_username" {
  type        = string
  description = "MongoDB User authentication username"
}

variable "mongodb_user_password" {
  type        = string
  description = "MongoDB User authentication password"
}

