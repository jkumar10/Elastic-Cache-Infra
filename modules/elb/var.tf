variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = null
}
variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = list(string)
}
variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  type        = list(string)
}



variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  type        = bool
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  type        = number
  default     = 400
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
