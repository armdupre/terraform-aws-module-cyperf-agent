variable "AmiName" {
	default = "cyperf-agent-1-0-862-master-tiger-1-0-3-523-10cb6682-8f45-4471-8f02-a4e12a7d5fb3"
	description = "AMI name used for deploying instances"
	type = string
}

variable "AmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying instances"
	type = string
}

variable "AppEth0IpAddress" {
	type = string
}

variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	type = string
}

variable "Eth1PrivateIpAddresses" {
	default = [ "10.0.2.12" ]
	type = list(string)
}

variable "InstanceId" {
	default = "AGENT1"
	type = string
}

variable "InstanceType" {
	default = "c5n.4xlarge"
	description = "Instance type of VM"
	type = string
	validation {
		condition = can(regex("c5n.18xlarge", var.InstanceType)) || can(regex("c5n.9xlarge", var.InstanceType)) || can(regex("c5n.4xlarge", var.InstanceType))
		error_message = "InstanceType must be one of (c5n.18xlarge | c5n.9xlarge | c5n.4xlarge) types."
	}
}

variable "PlacementGroupId" {
	type = string
}

variable "PrivateSubnetId" {
	type = string
}

variable "PrivateSecurityGroupId" {
	type = string
}

variable "ProjectTag" {
	default = "CLOUD_IST"
	type = string
}

variable "PublicSecurityGroupId" {
	type = string
}

variable "PublicSubnetId" {
	type = string
}

variable "UserEmailTag" {
	type = string
	description = "Email address tag of user creating the deployment"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	description = "Login ID tag of user creating the deployment"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}