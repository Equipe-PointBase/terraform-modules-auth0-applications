variable "applications" {
  description = "List of Auth0 applications"

  type = map(object({
    name        = string
    description = optional(string)

    app_type    = string
    grant_types = list(string)

    allowed_logout_urls = optional(list(string))
    callbacks           = optional(list(string))
    web_origins         = optional(list(string))

    organization_require_behavior = optional(string)
    organization_usage            = optional(string)

    sso = optional(bool)

    mobile = optional(object({
      ios = optional(object({
        app_bundle_identifier = string
        team_id               = string
      }))

      android = optional(object({
        app_package_name         = string
        sha256_cert_fingerprints = list(string)
      }))
    }))

    refresh_token = optional(object({
      expiration_type              = string
      idle_token_lifetime          = number
      infinite_idle_token_lifetime = bool
      infinite_token_lifetime      = bool
      leeway                       = number
      rotation_type                = string
      token_lifetime               = number
    }))

    audience = optional(string)
    scopes   = optional(list(string))
  }))
}