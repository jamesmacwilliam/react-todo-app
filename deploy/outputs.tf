output "nat1.ip" {
  value = "${aws_eip.nateip1.public_ip}"
}

output "nat2.ip" {
  value = "${aws_eip.nateip2.public_ip}"
}

output "asg1_name" {
  value = "${aws_autoscaling_group.asg_app1.id}"
}

output "asg2_name" {
  value = "${aws_autoscaling_group.asg_app2.id}"
}

output "elb_name" {
  value = "${aws_elb.elb_app.dns_name}"
}

output "url" {
  value = "http://${aws_elb.elb_app.dns_name}"
}
