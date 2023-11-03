output "client_ids" {
  description = "Applications Client IDs"
  value = [
    for app in auth0_client.applications :
    app.id
  ]
}
