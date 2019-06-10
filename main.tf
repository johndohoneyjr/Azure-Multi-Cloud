provider "azurerm" {
  version = "~> 1.0"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
}

resource "azurerm_resource_group" "vmss" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.rg_prefix}vnet"
  location            = "${azurerm_resource_group.vmss.location}"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = "${azurerm_resource_group.vmss.name}"
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  address_prefix       = "10.0.0.0/24"
  resource_group_name  = "${azurerm_resource_group.vmss.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_public_ip" "myip" {
  name                         = "test"
  location                     = "${azurerm_resource_group.vmss.location}"
  resource_group_name          = "${azurerm_resource_group.vmss.name}"
  allocation_method            = "Static"
  domain_name_label            = "${azurerm_resource_group.vmss.name}"

  tags = {
    environment = "staging"
  }
}

# create network interface
resource "azurerm_network_interface" "ni" {
    name = "tfni"
    location = "${azurerm_resource_group.vmss.location}"
    resource_group_name = "${azurerm_resource_group.vmss.name}"

    ip_configuration {
        name = "ipconfiguration"
        subnet_id = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.myip.id}"
    }
}

#
# create virtual machine
resource "azurerm_virtual_machine" "vm" {
    name = "${var.vmscaleset_name}"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.vmss.name}"
    network_interface_ids = ["${azurerm_network_interface.ni.id}"]
    vm_size = "Standard_A0"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "${var.vm_os_version}"
    }
    storage_os_disk {
      name              = "myosdisk1"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    os_profile {
      computer_name   = "hostname"
      admin_username  = "${var.admin_username}"
      admin_password  = "${var.admin_password}"
    }

    os_profile_linux_config {
      disable_password_authentication = false 
    }

    connection {
        type        = "ssh"
        host        = "${azurerm_public_ip.myip.ip_address}"
        user        = "${var.admin_username}"
        password    = "${var.admin_password}"
        timeout     = "20s"
      }

      provisioner "file" {
        content     = "${file("${path.module}/scripts/init.sh")}"
        destination = "/home/ubuntu/init.sh"
      }

      provisioner "remote-exec" {
          inline = [
            "cd /home/ubuntu",
            "chmod 755 init.sh",
            "./init.sh"
          ]
      }
}
