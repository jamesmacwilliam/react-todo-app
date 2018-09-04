resource "kubernetes_replication_controller" "todo" {
	metadata {
		name = "todo"

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
				image = "test"
				name  = "todo"

				port {
					container_port = 80
				}
			}
		}
	}
}
