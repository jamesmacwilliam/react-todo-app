resource "kubernetes_service" "todo_lb" {
	metadata {
		name = "todo-lb"
	}

	spec {
		selector {
			App = "todo"
		}

		port {
			port = 8080
			target_port = 80
		}

		type = "LoadBalancer"
	}
}
