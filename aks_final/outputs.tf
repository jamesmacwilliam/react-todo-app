output "container-id" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.id}"
}
output "container-host" {
  value = "${azurerm_kubernetes_cluster.todo_cluster.kube_config.0.host}"
}
output "site_address" {
  value = "http://${kubernetes_service.todo_lb.load_balancer_ingress.0.ip}:8080"
}
