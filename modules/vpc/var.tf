variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr-public-1" {
  description = "The CIDR block for the public-subnet-1. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.1.0/24"
}

variable "cidr-public-2" {
  description = "The CIDR block for the public-subnet-2. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cidr-private-1" {
  description = "The CIDR block for the private-subnet-1. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.3.0/24"
}

variable "cidr-private-2" {
  description = "The CIDR block for the private-subnet-2. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.4.0/24"
}

variable "cidr-private-3" {
  description = "The CIDR block for the private-subnet-3. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.5.0/24"
}

variable "public-1-az" {
  description = "The AZ for the public-subnet-1."
  type        = string
  default     = "us-east-1a"
}

variable "public-2-az" {
  description = "The AZ for the public-subnet-2."
  type        = string
  default     = "us-east-1b"
}

variable "private-1-az" {
  description = "The AZ for the private-subnet-1."
  type        = string
  default     = "us-east-1a"
}

variable "private-2-az" {
  description = "The AZ for the private-subnet-2."
  type        = string
  default     = "us-east-1b"
}
variable "private-3-az" {
  description = "The AZ for the private-subnet-3."
  type        = string
  default     = "us-east-1c"
}
