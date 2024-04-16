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

locals {
  load_balancer_port_name = var.load_balancer_port != null ? "load-balancer-port" : null

  # Construct the script to set environment variables
  env_script = join("\n", [for k, v in var.env_variables : "echo \"export ${k}='${v}'\" >> /etc/profile"])

  # Combine the environment variables script with the user's script
  combined_startup_script = "${local.env_script}\n\n${var.startup_script}"
}

data "google_compute_zones" "available" {
  project = var.project_id
  region  = var.region
}

module "instance_template" {
  source  = "terraform-google-modules/vm/google///modules/instance_template"
  version = "8.0.1"

  project_id = var.project_id
  name_prefix      = "${var.managed_instance_group_name}-template-"
  source_image     = var.vm_image
  network = var.network_name
  service_account = {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
  startup_script = local.combined_startup_script
}

module "mig" {
  source  = "terraform-google-modules/vm/google//modules/mig"
  version = "8.0.1"

  project_id                = var.project_id
  mig_name                  = var.managed_instance_group_name
  hostname                  = var.managed_instance_group_name
  instance_template         = module.instance_template.self_link
  region                    = var.region
  distribution_policy_zones = data.google_compute_zones.available.names
  autoscaling_enabled       = true
  health_check_name = var.health_check_name
  health_check = {
    type                = var.health_check_name != "" ? "http" : ""
    initial_delay_sec   = 30
    check_interval_sec  = 30
    healthy_threshold   = 1
    timeout_sec         = 10
    unhealthy_threshold = 5
    response            = ""
    proxy_header        = "NONE"
    port                = var.health_check_port
    request             = ""
    request_path        = var.health_check_request_path
    host                = ""
    enable_logging      = false
  }
  named_ports = var.load_balancer_port != null ? [
    {
      name = local.load_balancer_port_name
      port = var.load_balancer_port
    },
  ] : []
}
