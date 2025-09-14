
# variable "inst" {
#   type = map(object({
#     ami            = string
#     instance_type  = string
#     instance_name  = string
#   }))
# }

# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
# }

# variable "public_subnet_cidrs" {
#   type        = list(string)
#   description = "Public Subnet CIDR values"
# }

# variable "tags" {
#   type = map(string)
# }
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "owner" {
  type = string
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "tags" {
  type = map(string)
}
