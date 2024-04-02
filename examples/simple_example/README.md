# Simple Example

This example illustrates how to use the `solution-builder-vm` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| managed\_instance\_group\_name | Name of the managed instance group | `string` | n/a | yes |
| project\_id | The project ID to deploy the GCE VMs to | `string` | n/a | yes |
| region | The region where the GCE VMs should be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| managed\_instance\_group | Managed instance group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
