resource "auth0_client" "applications" {
  for_each = var.applications

  name        = each.value.name
  description = each.value.description

  app_type    = each.value.app_type
  grant_types = each.value.grant_types

  allowed_logout_urls = each.value.allowed_logout_urls
  callbacks           = each.value.callbacks
  web_origins         = each.value.web_origins

  organization_require_behavior = each.value.organization_require_behavior
  organization_usage            = each.value.organization_usage

  sso = each.value.sso

  dynamic "mobile" {
    for_each = each.value.mobile != null ? [1] : []
    content {

      dynamic "ios" {
        for_each = each.value.mobile.ios != null ? [1] : []
        content {
          app_bundle_identifier = each.value.mobile.ios.app_bundle_identifier
          team_id               = each.value.mobile.ios.team_id
        }
      }

      dynamic "android" {
        for_each = each.value.mobile.android != null ? [1] : []
        content {
          app_package_name         = each.value.mobile.android.app_package_name
          sha256_cert_fingerprints = each.value.mobile.android.sha256_cert_fingerprints
        }
      }

    }
  }

  dynamic "refresh_token" {
    for_each = each.value.refresh_token != null ? [1] : []
    content {
      expiration_type              = each.value.refresh_token.expiration_type
      idle_token_lifetime          = each.value.refresh_token.idle_token_lifetime
      infinite_idle_token_lifetime = each.value.refresh_token.infinite_idle_token_lifetime
      infinite_token_lifetime      = each.value.refresh_token.infinite_token_lifetime
      leeway                       = each.value.refresh_token.leeway
      rotation_type                = each.value.refresh_token.rotation_type
      token_lifetime               = each.value.refresh_token.token_lifetime
    }
  }
}

resource "auth0_client_grant" "application_grant" {
  for_each = { for key, app_grant in var.applications : key => app_grant if app_grant.audience != null }

  client_id = auth0_client.applications[each.key].client_id

  audience = each.value.audience
  scopes   = each.value.scopes
}