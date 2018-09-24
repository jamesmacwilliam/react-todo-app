variable "docker_un" {}
variable "docker_pw" {}

# use default context for docker if installed on a mac
variable "kube_context" {
	default = "docker-for-desktop"
}

# used for implicit dependency ordering (explicit ordering is not available for modules)
variable "input_dependency" {
	default = "dummy_val"
}
