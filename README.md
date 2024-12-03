# module-cyperf-agent/aws

## Description
Terraform module for CyPerf agent deployment on Amazon Web Services

## Deployment
This module creates a single instance having two network interfaces.

## Usage
```tf
module "Agent" {
	source  = "git::https://github.com/armdupre/terraform-aws-module-cyperf-agent.git"
	AppEth0IpAddress = aws_instance.App.private_ip
	Eth0SecurityGroupId = aws_security_group.PublicSecurityGroup.id
	Eth0SubnetId = aws_subnet.PublicSubnet.id
	Eth1SecurityGroupId = aws_security_group.PrivateSecurityGroup.id
	Eth1SubnetId = aws_subnet.PrivateSubnet.id
	PlacementGroupId = aws_placement_group.PlacementGroup.id
}
```