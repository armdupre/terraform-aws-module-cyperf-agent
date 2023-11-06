locals {
	AmiName = var.AmiName
	AmiOwner = var.AmiOwner
	AppEth0IpAddress = var.AppEth0IpAddress
	Eth0Name = "${local.Preamble}-eth0-${local.Region}"
	Eth0PrivateIpAddress = var.Eth0PrivateIpAddress
	Eth0SecurityGroupId = var.Eth0SecurityGroupId
	Eth0SubnetId = var.Eth0SubnetId
	Eth1Name = "${local.Preamble}-eth1-${local.Region}"
	Eth1PrivateIpAddresses = var.Eth1PrivateIpAddresses
	Eth1SecurityGroupId = var.Eth1SecurityGroupId
	Eth1SubnetId = var.Eth1SubnetId
	IamInstanceProfileName = "${local.Preamble}-iam-instance-profile-${local.Region}"
	IamPolicyName = "${local.Preamble}-iam-policy-${local.Region}"
	IamRoleName = "${local.Preamble}-iam-role-${local.Region}"
	InstanceDisableApiTermination = false
	InstanceEbsDeleteOnTermination = true
	InstanceEbsVolumeType = "gp2"
	InstanceId = var.InstanceId
	InstanceInstanceInitiatedShutdownBehavior = "stop"
	InstanceMonitoring = false
	InstanceName = var.InstanceName == null ? "${local.Preamble}-instance-${local.Region}" : var.InstanceName
	InstanceType = var.InstanceType
	InterfaceSourceDestCheck = false
	PlacementGroupId = var.PlacementGroupId
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.Tag}-${local.InstanceId}-${local.Version}"
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
rm -rf /etc/portmanager/node_id.txt
cyperfagent controller set ${local.AppEth0IpAddress}
    EOF
}