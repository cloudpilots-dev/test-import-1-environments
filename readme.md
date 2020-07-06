# Terraform Environments Template

Template to create project staging environments inside a business domain.

- Business domain 1
  - Test environment (<-- this is a staging environment)
  - Dev environment
  - Prod environment
- Business domain 2
  - ...

## Usage

```hcl
module "my_environment" {
  source          = "git::git@git.cloudpilots.com:customers/veroo/tf-module-environment"
  billing_account = "my-billing-id"
  dns_domain      = "my-dns-domain"
  domain          = "my-domain"
  environment     = "my-new-environment"
  folder_id       = "my-folder-id"
  name            = "Custom Name"
  project_suffix  = "some-suffix"
  gcs_service     = true
  parent_repo     = github_repository.domain.name
  bucket_name     = lower("tfstate-${var.domain}-${var.project_suffix}")
  gcp_services    = ["cloudresourcemanager", "cloudbilling", "serviceusage"]
}
```

## Inputs

| Name              | Description                                                  | Type   | Default | Required | Example                                                    |
| ----------------- | ------------------------------------------------------------ | ------ | ------- | -------- | ---------------------------------------------------------- |
| billing_account   | The ID of the billing account to associate this project with | string | n/a     | no       | `"012345-ABCDEF-67890G"`                                   |
| dns_domain        | The domain of the DNS to associate this project with         | string | n/a     | no       | `"test-demo-45.cpl.cloud"`                                 |
| domain`*`         | The domain for the created environments                      | string | n/a     | yes      | `"dev"`                                                    |
| enviornment`*`    | The created environment                                      | string | n/a     | yes      | `"dev"`                                                    |
| folder_id`*`      | The ID of a parent folder to host the environments           | string | n/a     | yes      | `01234567898`                                              |
| name`*`           | The name for the created environments                        | string | n/a     | yes      | `"Namespace"`                                              |
| project_suffix`*` | The suffix for the created domain                            | string | n/a     | yes      | `"demo"`                                                   |
| parent_repo       | The name of the mono repo of the domain                      | string | n/a     | no       | `"veroo-io"`                                               |
| bucket_name       | The name of the Google Storage bucket                        | string | n/a     | no       | `lower("tfstate-${var.domain}-${var.project_suffix}")`     |
| gcp_services      | The gcp services needed by the service account               | string | n/a     | no       | `["cloudresourcemanager", "cloudbilling", "serviceusage"]` |

`* = required`

## Jira issue

[ISSUE-4](https://github.com/veroo-io/iac-terraform-project/issues/4)
[ISSUE-5](https://github.com/veroo-io/iac-terraform-project/issues/5)
[ISSUE-9](https://github.com/veroo-io/iac-terraform-project/issues/9)

## Features

- Create a folder
- Create Google Storage bucket
- Create domain repo
- Create environments repo
- Write several secrets to github
- Uses the enviornment module to do further processing

## Projects

- dev
- test
- demo1
- qa
- prod
- sandbox
- tfstate

## Terraform Links

### [Google Modules](https://github.com/terraform-google-modules)

### [Google Cloud Project Factory](https://github.com/terraform-google-modules/terraform-google-project-factory)

This module allows you to create opinionated Google Cloud Platform projects. It creates projects and configures aspects like Shared VPC connectivity, IAM access, Service Accounts, and API enablement to follow best practices.

### [Google Cloud DNS Module](https://github.com/terraform-google-modules/terraform-google-cloud-dns)

This module makes it easy to create Google Cloud DNS zones of different types, and manage their records. It supports creating public, private, forwarding, and peering zones.

The `resources/services/activations/deletions` that this module will create/trigger are:

- One `google_dns_managed_zone` for the zone
- Zero or more `google_dns_record_set` for the zone records

### [Google Cloud Folders](https://github.com/terraform-google-modules/terraform-google-folders)

This module helps create several `folders` under the same parent, enforcing consistent permissions, and with a common naming convention.

The `resources/services/activations/deletions` that this module will create/trigger are:

- Create folders with the provided names
- Assign the defined permissions to the provided list of users or groups

### [Google Cloud Folders IAM](https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/folders_iam)

This optional module is used to assign folder roles

### [Github Provider](https://github.com/terraform-providers/terraform-provider-github)

## Used provider versions

Terraform 0.12
Google ~> 3
Google-Beta ~> 3
