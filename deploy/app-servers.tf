resource "aws_autoscaling_group" "asg_app1" {
  lifecycle {
    create_before_destroy = true
  }

  # interpolate the LC into the ASG name so it always forces an update
  name                      = "asg-app - ${aws_launch_configuration.lc_app.name}"
  max_size                  = 2
  min_size                  = 1
  wait_for_elb_capacity     = 1
  desired_capacity          = 1
  health_check_grace_period = 150
  health_check_type         = "ELB"
  launch_configuration      = "${aws_launch_configuration.lc_app.id}"
  load_balancers            = ["${aws_elb.elb_app.id}"]

  vpc_zone_identifier = ["${data.aws_availability_zones.available.ids[0]}"]
}

resource "aws_autoscaling_group" "asg_app2" {
  lifecycle {
    create_before_destroy = true
  }

  # interpolate the LC into the ASG name so it always forces an update
  name                      = "asg-app - ${aws_launch_configuration.lc_app.name}"
  max_size                  = 2
  min_size                  = 1
  wait_for_elb_capacity     = 1
  desired_capacity          = 1
  health_check_grace_period = 150
  health_check_type         = "ELB"
  launch_configuration      = "${aws_launch_configuration.lc_app.id}"
  load_balancers            = ["${aws_elb.elb_app.id}"]

  vpc_zone_identifier = ["${data.aws_availability_zones.available.ids[1]}"]
}

resource "aws_launch_configuration" "lc_app" {
  lifecycle {
    create_before_destroy = true
  }

  image_id      = "${var.ami}"
  instance_type = "t2.micro"

  # Our Security group to allow HTTP and SSH access
  security_groups = ["${aws_security_group.nginx-sg.id}"]

  key_name  = "deployer"
}
