resource "null_resource" "build" {
	triggers {
		cksum = "${var.cksum}"
	}

	provisioner "local-exec" {
		command = "docker build -t ${var.docker_username}/todo -f ../Dockerfile ../."
	}
}

resource "null_resource" "push" {
	triggers {
		cksum = "${var.cksum}"
	}

	provisioner "local-exec" {
		command = "docker push ${var.docker_username}/todo"
	}
}
