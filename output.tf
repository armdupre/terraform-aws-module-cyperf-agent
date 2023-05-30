output "Ami" {
	value = {
		"image_id" : data.aws_ami.Ami.image_id
		"name" : data.aws_ami.Ami.name
		"owner_id" : data.aws_ami.Ami.owner_id
	}
}

output "Instance" {
	value = {
		"ami" : aws_instance.Instance.ami
		"arn" : aws_instance.Instance.arn
		"availability_zone"	:  aws_instance.Instance.availability_zone
		"disable_api_termination" : aws_instance.Instance.disable_api_termination
		"iam_instance_profile" : aws_instance.Instance.iam_instance_profile
		"id" : aws_instance.Instance.id
		"instance_initiated_shutdown_behavior" : aws_instance.Instance.instance_initiated_shutdown_behavior
		"instance_type" : aws_instance.Instance.instance_type
		"monitoring" : aws_instance.Instance.monitoring
		"primary_network_interface_id" : aws_instance.Instance.primary_network_interface_id
		"private_dns" : aws_instance.Instance.private_dns
		"private_ip" : aws_instance.Instance.private_ip
		"public_dns" : aws_instance.Instance.public_dns
		"public_ip" : aws_instance.Instance.public_ip
		"subnet_id" : aws_instance.Instance.subnet_id
		"tags" : aws_instance.Instance.tags
	}
}