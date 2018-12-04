variable "rg_prefix" {
  description = "The shortened abbreviation to represent your resource group that will go on the front of some resources."
  default     = "rg"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "dohoneyrg"
}

variable "location" {
  description = "The location where the resources will be created"
  default     = "westcentralus"
}

variable "vm_size" {
  default     = "Standard_A0"
  description = "Size of the Virtual Machine based on Azure sizing"
}

variable "vmscaleset_name" {
  default     = "vmscaleset"
  description = "The name of the VM scale set that will be created in Azure"
}

variable "computer_name_prefix" {
  default     = "vmss"
  description = "The prefix that will be used for the hostname of the instances part of the VM scale set"
}

variable "managed_disk_type" {
  default     = "Standard_LRS"
  description = "Type of managed disk for the VMs that will be part of this compute group. Allowable values are 'Standard_LRS' or 'Premium_LRS'."
}

variable "data_disk_size" {
  description = "Specify the size in GB of the data disk"
  default     = "50"
}

variable "admin_username" {
  description = "The admin username of the VMSS that will be deployed"
  default     = "ubuntu"
}

variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure"
  default     = "B13cbfa3!"
}

variable "env" {
  description="This has one of two values, OSS or TFE to drive where TF obtains the public key value"
  default="OSS"
}

variable "ssh_key" {
  description = "Path to the public key to be used for ssh access to the VM"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_value" {
  description = "Path to the public key to be used for ssh access to the VM"
  default     = "actual-public-key-value"
}

variable "nb_instance" {
  description = "Specify the number of vm instances"
  default     = "1"
}


variable "network_profile" {
  default     = "terraformnetworkprofile"
  description = "The name of the network profile that will be used in the VM scale set"
}

variable "vm_os_simple" {
  description = "Specify Ubuntu or Windows to get the latest version of each os"
  default     = ""
}

variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy"
  default     = ""
}

variable "vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy"
  default     = ""
}

variable "vm_os_sku" {
  description = "The sku of the image that you want to deploy"
  default     = ""
}

variable "vm_os_version" {
  description = "The version of the image that you want to deploy."
  default     = "latest"
}



variable "tags" {
  type        = "map"
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
