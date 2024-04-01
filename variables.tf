/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project ID to deploy the GCE VMs to"
  type        = string
}

variable "region" {
  description = "The region where the GCE VMs should be deployed"
  type = string
}

variable "managed_instance_group_name" {
  description = "Name of the managed instance group"
  type = string
}

variable "vm_image" {
  description = "The image from which to initialize the VM disk"
  default = ""
  type = string
}

variable "network_name" {
  type = string
  default = ""
  description = "VPC network name where the GCE VMs are created"
}

variable "service_account_email" {
  type = string
  default = null
  description = "Email of the service account that should be attached to the GCE VMs"
}

variable "env_variables" {
  type = map(string)
  default = {}
  description = "Environment variables for GCE VMs"
}

variable "startup_script" {
  type = string
  default = ""
  description = "Startup script for GCE VMs"
}

variable "load_balancer_port" {
  type = string
  default = null
  description = "Port for load balancer to connect to the VM instances"
}
