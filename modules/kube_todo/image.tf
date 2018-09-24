data "external" "meta" {
	program = ["sh", "/Users/jamesmacwilliam/code/react/react-todo-app/kube_todo_meta.sh"]
}

resource "null_resource" "kubectl_context" {
	triggers {
		inc = "${data.external.meta.result.inc}"
	}

	provisioner "local-exec" {
		command = "kubectl config use-context ${var.kube_context}"
	}
}

resource "null_resource" "login" {
	triggers {
		cksum = "${data.external.meta.result.cksum}"
	}

	provisioner "local-exec" {
		command = "docker login -u ${var.docker_un} -p '${var.docker_pw}'"
	}
}

resource "null_resource" "build" {
	triggers {
		cksum = "${data.external.meta.result.cksum}"
	}

	provisioner "local-exec" {
		command = "docker build -t ${var.docker_un}/todo -f ../Dockerfile ../."
	}

	depends_on = ["null_resource.login"]
}

resource "null_resource" "push" {
	triggers {
		cksum = "${data.external.meta.result.cksum}"
	}

	provisioner "local-exec" {
		command = "docker push ${var.docker_un}/todo"
	}

	depends_on = ["null_resource.build"]
}
