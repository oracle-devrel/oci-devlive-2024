output "deploy_id" {
  value = random_string.deploy_id.result
}

output "user_name" {
  value = oci_identity_user.ocir_user.name
}

output "user_auth_token" {
  sensitive = true
  value     = oci_identity_auth_token.ocir_user_auth_token.token
}

output "user_email" {
  value = oci_identity_user.ocir_user.email
}

output "repository_name" {
  value = oci_artifacts_container_repository.container_repository.display_name
}
