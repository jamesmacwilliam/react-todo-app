resource "kubernetes_replication_controller" "todo" {
	metadata {
		name = "todo-controller"

		labels {
			App = "todo"
		}
	}

	spec {
		replicas = 2
		selector {
			App = "todo"
		}

		template {
			container {
				image = "yeasy/simple-web:latest"
				name  = "todo"

				port {
					container_port = 80
				}
			}
		}
	}
}
