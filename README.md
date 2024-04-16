# terraform-google-solution-builder-vm

## Description
### Tagline
Google Compute Engine (GCE) VMs offer scalable, high-performance virtual machines that run on Google's advanced infrastructure, enabling you to deploy and scale applications globally with ease.

### Detailed
This composition unit creates a GCE VM instance template and a regional managed instance group.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a VM instance template.
- Create a managed instance group.

### PreDeploy
To deploy this blueprint you must have an active billing account and billing permissions.

## Documentation
- [Compute Engine](https://cloud.google.com/compute/docs/instances)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env\_variables | Environment variables for GCE VMs | `map(string)` | `{}` | no |
| health\_check\_name | Health check name for the GCE VMs Managed Instance Group | `string` | `""` | no |
| health\_check\_port | Port where the health check request is sent | `number` | `80` | no |
| health\_check\_request\_path | Path where the health check request is sent | `string` | `"/"` | no |
| load\_balancer\_port | Port for load balancer to connect to the VM instances | `string` | `null` | no |
| managed\_instance\_group\_name | Name of the managed instance group | `string` | n/a | yes |
| network\_name | VPC network name where the GCE VMs are created | `string` | `"default"` | no |
| project\_id | The project ID to deploy the GCE VMs to | `string` | n/a | yes |
| region | The region where the GCE VMs should be deployed | `string` | n/a | yes |
| service\_account\_email | Email of the service account that should be attached to the GCE VMs | `string` | `null` | no |
| startup\_script | Startup script for GCE VMs | `string` | `""` | no |
| vm\_image | The image from which to initialize the VM disk | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| health\_check\_link | Health check link |
| load\_balancer\_port\_name | Port name for load balancer to connect to the VM instances |
| managed\_instance\_group\_url | Managed instance group URL |
| module\_dependency | Dependency variable that can be used by other modules to depend on this module |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.13
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v3.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Compute Admin: `roles/compute.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Compute Engine API: `compute.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html

## Security Disclosures

Please see our [security disclosure process](./SECURITY.md).
