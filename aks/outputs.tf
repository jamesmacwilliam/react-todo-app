output "site_address" {
	value = "http://${kubernetes_service.todo_lb.load_balancer_ingress.0.ip}:8080"
}
