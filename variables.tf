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
  default="TFE"
}

variable "ssh_key" {
  description = "Path to the public key to be used for ssh access to the VM"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_value" {
  description = "Path to the public key to be used for ssh access to the VM"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZwrOCRWDq7ULVogyfiA2Pitd40M9WwIya8F92A6g4B7GIiOWt5ZYWAcbSIA9FEbld01sqiUETuGL21dNVoLHy/opak+3RWayqWW2sSTtQ/a5NrsPRKlWyqNbJ3L0ONCnw5rO+2+pRPGxpG2+d/ZO+6/X7ScpLyVG9ZXGpLl/n+yZyyvQFxw2yBXWbwTf9Qbkoi8gnzdrlB7szXWoNe14S1f6WETYO15qNw3d3tlA5T/Lcg1RdTbZZkqHnZg917ozRZs46Qcd+7UP6+eZxKilJpCA5b8ImKtjeqpOSclJk0DWuMB+ry3VOVeXQYKOQNSFrdwv2HpXfUzA/ngGa6XPH"
}

variable "ssh_pvt_key" {
  description="Value of your private key"
  default="-----BEGIN RSA PRIVATE KEY----- MIIEpAIBAAKCAQEA2cKzgkVg6u1C1aIMn4gNj4rXeNDPVsCMmvBfdgOoOAexiIjl reWWFgHG0iAPRRG5XdNbKolBE7hi9tXTVaCx8v6KWpPt0VmsqlltrEk7UP2uTa7D 0SpVsqjWydy9DjQp8OazvtvqUTxsaRtvnf2Tvuv1+0nKS8lRvWVxqS5f5/smcsr0 BccNsgV1m8E3/UG5KIvIJ83a5Qe7M11qDXteEtX+lhE2DteajcN3d7ZQOU/y3INU XU22WZKh52YPde6M0WbOOkHHfu1D+vnmcSopSaQgOW/CJirY3qqTknJSZNA1rjAf q8t1TlXl0GCjkDUha3cL9h6V31MwP54BmulzxwIDAQABAoIBABNgyCink+BUDMaG DSmFKe/EIziVHF5T9C81hMkzuhyCUsIbrJS1AY4jylWYlMNIuH4o+MvoOupOVkAw 9wV/r1Y4YId+8oLWwA7ItoHGYojqikBPdQ1//vBPJg4AnrJM4g6V+Rja6RchkWQp FN2yWxt6VAFwp5fm6mc4R80OW2qBPPJAPAb5Mbw+wqfiaTQl4gA2urGurRNiKP6N Zci3seiuctvQ1BPnMbtSNPD0kKIWhrrJinV2zTnWIGmJ1avctucima4ns2aLDRJM 5VIH9z2tYPRba6dGUZH0x4xh7rPscTDLT73G4a4VlC2FgunXTGkyrowqTCtvC2wu dv0G4MECgYEA9ulx8eB1sxUP/ohrgJ5yLxMiufsQgbG6xTxvahiE/y/ZT5zJEXG0 XorKuQVdhJwGZdeDv9VTpZTCs8j9g1s4tjs/mikSeOChRX0NKOP6zfrqFTiZvY0n Jf8OIaP93QJjPWunUZs4vbFCXB07EWyhnMopQD2lOkFouYfFAXMStQMCgYEA4caT Br7mN5viMwJBpu3GfYZ0Kj/+XmCidAB7VFHH5sV5MSgtG6CBc2KqxgiUbIHu6gVW cGedPVbAB2rdK0ibuwbPui3rdrp1ReUUyj2W5RFrywPN8NBpf/E96lSUR3nQ09wl wKwzOVO3FPoCFYDjqSErCqFCj7Bi9sCLQPfSoO0CgYEAl0y/fOb9WKp8bY1sypjN AVmpeuuE1uRwvXHmF85EmRbaA/XgI+dYDmLgDHZkMuFk7j0cx41SP3GjyYVNC5P3 cXtm4vFuF1IWoL0bNkZVJqktjalsVAHNznO3VhfmdOqEo1t3YQNLxrl7H3TuACRf 9/LNSkc8GzF/mci/iL7Z5L8CgYB6k7HtPqWE2Xgkk3wLYhqaue3Fpnq2yKZKbpyG uePbEalrm9Fpp2nAuHfZDn1ur9iDa6RzYH3I+JlHLaioQEJ0dw0+moG1MyRKb0Yr SubqtNueHBGqRayRjus7lvHuIF/VNje09IjW/fFvTRDmldSEVYKlwcl+c5g3OXAh NKtBPQKBgQDNdeMin5jXtb0Mq43o90a7dYoG4fQx+csEjBkArfrkD+4CWJlr9MaD luCY4wXuCIjPYb41NVePpepqk2Wcpsu1NhGxgXV6U9ei/P2bTXVExs1AnX8BtLYc RVJZukMAhc85Lg4y3YHtlunswWDxnBO7d7L9Ctg0qi2TwQ65z3z+NA== -----END RSA PRIVATE KEY-----"
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
