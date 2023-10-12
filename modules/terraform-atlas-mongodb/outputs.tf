output "project_name" {
  value = mongodbatlas_project.atlas-atlas-monogo-project.name
}

output "atlas_cluster_connection_string" {
  value = mongodbatlas_advanced_cluster.atlas-atlas-monogo-project-cluster.connection_strings.0.standard_srv
}
