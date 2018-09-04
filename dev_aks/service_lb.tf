resource "kubernetes_service" "todo_lb" {
	metadata {
		name = "todo"
	}

	spec {
		selector {
			App = "${kubernetes_replication_controller.todo.metadata.0.labels.App}"
		}

		port {
			port = 80
			target_port = 8081
		}

		type = "LoadBalancer"
	}
}
