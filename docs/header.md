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
