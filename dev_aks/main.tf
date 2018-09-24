provider "kubernetes" {}

variable "docker_un" {}
variable "docker_pw" {}

module "kube_todo" {
	source = "../modules/kube_todo"

	docker_un = "${var.docker_un}"
	docker_pw = "${var.docker_pw}"
}

output "site" {
	value = "${module.kube_todo.lb_site_address}"
}
