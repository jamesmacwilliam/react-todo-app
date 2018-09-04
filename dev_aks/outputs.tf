output "lb_ip" {
	value = "${kubernetes_service.todo_lb.load_balancer_ingress.0.ip}"
}
