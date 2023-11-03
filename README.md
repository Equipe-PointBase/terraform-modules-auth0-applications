<!-- BEGIN_TF_DOCS -->
<div align="center">

<p align="center"> <img src="./docs/terraform-logo-black.png" width="100" height="100"></p>

<h1 align="center">
    Terraform Auth0 - Applications
</h1>

<p align="center" style="font-size: 1.2rem;">
This terraform module is designed to create Auth0 Clients (Applications)
</p>

</p>

</div>

<hr>

## Example

### Creating Applications on Auth0

Let's take the following usage code snipet as an example for the creation of an Application

```hcl

module "applications" {
  source      = ""

  applications       = var.applications
}
```

Passing the below value to the module.

```hcl
applications ={
  app = {
    # Client configuration
    name = "my-app-name"

    app_type    = "non_interactive"
    grant_types = ["client_credentials"]

    # Binds a client to a Resource Server (API), do not set if you don't want to link your app to a resource server.
    audience = "https://my-app-name.com"
    scopes   = ["read:tenant_settings"]
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.1 |
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | 1.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | List of Auth0 applications | <pre>map(object({<br>    name        = string<br>    description = optional(string)<br><br>    app_type    = string<br>    grant_types = list(string)<br><br>    allowed_logout_urls = optional(list(string))<br>    callbacks           = optional(list(string))<br>    web_origins         = optional(list(string))<br><br>    organization_require_behavior = optional(string)<br>    organization_usage            = optional(string)<br><br>    sso = optional(bool)<br><br>    mobile = optional(object({<br>      ios = optional(object({<br>        app_bundle_identifier = string<br>        team_id               = string<br>      }))<br><br>      android = optional(object({<br>        app_package_name         = string<br>        sha256_cert_fingerprints = list(string)<br>      }))<br>    }))<br><br>    refresh_token = optional(object({<br>      expiration_type              = string<br>      idle_token_lifetime          = number<br>      infinite_idle_token_lifetime = bool<br>      infinite_token_lifetime      = bool<br>      leeway                       = number<br>      rotation_type                = string<br>      token_lifetime               = number<br>    }))<br><br>    audience = optional(string)<br>    scopes   = optional(list(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_ids"></a> [client\_ids](#output\_client\_ids) | Applications Client IDs |

## Release notes

Release notes are available [here (link to update)](??/-/releases).

## Bug Reports & Feature Requests

Bug reports & feature requests should be reported in gitlab [here (link to update)](??/issues), before submitting an issue or a merge request, please check our [submission guidlines](CONTRIBUTING.md)

## Contributing

To build more comprehensive & better terraform modules by adding and laveraging features that meet  business cases, we need your contribution to maintain & move toward our Digital DevOps Terraform module portofolio.

**You want to participate ?** Checkout our guidlines for [contributing](CONTRIBUTING.md).
<!-- END_TF_DOCS -->