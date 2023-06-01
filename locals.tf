locals {
	AmiName = var.AmiName
	AmiOwner = var.AmiOwner
	AppEth0IpAddress = var.AppEth0IpAddress
	Eth0Name = "${local.Preamble}-eth0-${local.Region}"
	Eth0PrivateIpAddress = var.Eth0PrivateIpAddress
	Eth1Name = "${local.Preamble}-eth1-${local.Region}"
	Eth1PrivateIpAddresses = var.Eth1PrivateIpAddresses
	IamInstanceProfileName = "${local.Preamble}-iam-instance-profile-${local.Region}"
	IamPolicyName = "${local.Preamble}-iam-policy-${local.Region}"
	IamRoleName = "${local.Preamble}-iam-role-${local.Region}"
	InterfaceSourceDestCheck = false
	InstanceDisableApiTermination = false
	InstanceEbsDeleteOnTermination = true
	InstanceEbsVolumeType = "gp2"
	InstanceId = var.InstanceId
	InstanceInstanceInitiatedShutdownBehavior = "stop"
	InstanceMonitoring = false
	InstanceName = "${local.Preamble}-${local.Region}"
	InstanceType = var.InstanceType
	PlacementGroupId = var.PlacementGroupId
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.Tag}-${local.InstanceId}-${local.Version}"
	PrivateSecurityGroupId = var.PrivateSecurityGroupId
	PrivateSubnetId = var.PrivateSubnetId
	PublicSecurityGroupId = var.PublicSecurityGroupId
	PublicSubnetId = var.PublicSubnetId
	Region = data.aws_region.current.name
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	Version = var.Version
}

locals {
	init_cli = <<-EOF
#!/bin/bash -xe
snap list amazon-ssm-agent
cyperfagent controller set ${local.AppEth0IpAddress}
    EOF
}