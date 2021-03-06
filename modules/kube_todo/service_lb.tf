resource "kubernetes_service" "todo_lb" {
	metadata {
		name = "todo-lb"
	}

	depends_on = ["null_resource.push"]

	spec {
		selector {
			App = "${kubernetes_replication_controller.todo.metadata.0.labels.App}"
		}

		port {
			port = 8080
			target_port = 80
		}

		type = "LoadBalancer"
	}
}
