locals {
	AmiName = var.AmiName
	AmiOwner = var.AmiOwner
	AppEth0IpAddress = var.AppEth0IpAddress
	Eth0PrivateIpAddress = var.Eth0PrivateIpAddress
	Eth1PrivateIpAddresses = var.Eth1PrivateIpAddresses
	InterfaceSourceDestCheck = false
	InstanceDisableApiTermination = false
	InstanceEbsDeleteOnTermination = true
	InstanceEbsVolumeType = "gp2"
	InstanceId = var.InstanceId
	InstanceInstanceInitiatedShutdownBehavior = "stop"
	InstanceMonitoring = false
	InstanceType = var.InstanceType
	PlacementGroupId = var.PlacementGroupId
	PrivateSecurityGroupId = var.PrivateSecurityGroupId
	PrivateSubnetId = var.PrivateSubnetId
	ProjectTag = var.ProjectTag
	PublicSecurityGroupId = var.PublicSecurityGroupId
	PublicSubnetId = var.PublicSubnetId
	Region = data.aws_region.current.name
	RegionTag = upper(replace(local.Region, "-", "_"))
	Tag = "CYPERF"
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	Version = "2.1"
	uuid = substr(uuid(), 1, 6)
}

locals {
	init_cli = <<-EOF
#!/bin/bash -xe
snap list amazon-ssm-agent
cyperfagent controller set ${local.AppEth0IpAddress}
    EOF
}