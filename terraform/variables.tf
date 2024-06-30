variable "aws_region" {
  description = "value"
  type        = string
  nullable    = false
}

variable "aws_vpc_name" {
  description = "nome"
  type        = string
  nullable    = false
}

variable "aws_vpc_cidr" {
  description = "value"
  type        = string
  nullable    = false
}

variable "aws_vpc_azs" {
  description = "value"
  type        = set(string)
  nullable    = false
}

variable "aws_private_subnet" {
  description = "value"
  type        = set(string)
  nullable    = false
}

variable "aws_public_subnet" {
  description = "value"
  type        = set(string)
  nullable    = false
}

variable "aws_eks_name" {
  description = "value"
  type        = string
  nullable    = false
}

variable "aws_eks_version" {
  description = "value"
  type        = string
  nullable    = false
}

variable "aws_eks_instance_types" {
  description = "value"
  type        = set(string)
  nullable    = false
}

variable "aws_project_tags" {
  description = "value"
  type        = map(any)
  nullable    = false
}



