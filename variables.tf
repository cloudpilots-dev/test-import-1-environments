# defined variables
variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate this project with"
  default     = ""
}

variable "dns_domain" {
  type        = string
  description = "The dns domain name e.g. `eta.cpl.cloud`"
}

variable "domain" {
  type        = string
  description = "The namespace for the created environments e.g. `demo-test`"
}

variable "folder_id" {
  type        = string
  description = "The ID of a folder to host the environments"
}

variable "name" {
  type        = string
  description = "The name for the created environments e.g. `Demo Test`"
}

variable "bucket_name" {
  type        = string
  description = "The name bucket for the created environments e.g. `Demo Test`"
}

variable "project_suffix" {
  type        = string
  description = "The suffix for the created environments e.g. `veroo`"
  default     = "veroo"
}

variable "parent_repo" {
  type        = string
  description = "The mono repo for the created domain"
}
