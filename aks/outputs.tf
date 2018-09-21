output "container-id" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.id}"
}
output "container-host" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.kube_config.0.host}"
}
output "site_address" {
  value = "${module.kube_todo.lb_site_address}"
}
