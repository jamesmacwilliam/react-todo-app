resource "aws_elb" "elb_app" {
  name = "app-elb"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 15
  }

  cross_zone_load_balancing = true
  idle_timeout              = 60
  subnets                   = ["${data.aws_availability_zones.available.ids[0]}", "${data.aws_availability_zones.available.ids[1]}"]
  security_groups           = ["${aws_security_group.elb-sg.id}"]
}
