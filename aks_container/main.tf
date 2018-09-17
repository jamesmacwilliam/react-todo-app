provider "azurerm" {
}

resource "azurerm_resource_group" "todo_group" {
  name = "todo-g"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "todo_cluster" {
  name = "todo-k"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.todo_group.name}"
  dns_prefix = "${var.dns_prefix}"

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${file("${var.public_key_path}")}"
    }
  }

  agent_pool_profile {
    name = "default"
    count = "2"
    vm_size = "Standard_D2"
    os_type = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
}

output "id" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.id}"
}
output "host" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.kube_config.0.host}"
}
