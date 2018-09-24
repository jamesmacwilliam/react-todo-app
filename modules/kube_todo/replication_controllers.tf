resource "kubernetes_replication_controller" "todo" {
	metadata {
		name = "todo-controller"

		labels {
			App = "todo"
		}
	}

	depends_on = ["null_resource.push"]

	spec {
		replicas = 2
		selector {
			App = "todo"
		}

		template {
			container {
				image = "${var.docker_un}/todo"
				name  = "todo"

				port {
					container_port = 80
				}
			}
		}
	}
}
