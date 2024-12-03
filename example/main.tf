terraform {
  cloud {
    organization = "tfo-apj-demos"
    workspaces {
      project = "aaron-dev"
      name = "my-first-vsphere-vm"
    }
  }
}
module "single-virtual-machine" {
  source  = "app.terraform.io/tfo-apj-demos/single-virtual-machine/vsphere"
  version = "~> 1"

  backup_policy    = "monthly"
  environment      = "dev"
  os_type          = "linux"
  security_profile = "web-server"
  site             = "sydney"
  size             = "medium"
  storage_profile  = "standard"
  tier             = "bronze"
  ad_domain        = "hashicorp.local"
}

output "vm_name" {
    value = module.single-virtual-machine.virtual_machine_name
}