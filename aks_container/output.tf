output "container-id" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.id}"
}
output "container-host" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.kube_config.0.host}"
}
output "kube_config" {
	value = "${azurerm_kubernetes_cluster.todo_cluster.kube_config_raw}"
}
