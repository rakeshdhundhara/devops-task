
# inst = {
#   dev = {
#     ami           = "ami-0522ab6e1ddcc7055"
#     instance_type = "t2.micro"
#     instance_name = "dev-instance"
#   }


# }

# azs = ["ap-south-1a", "ap-south-1b"]

# public_subnet_cidrs = ["172.31.1.0/24", "172.31.2.0/24"]

# tags = {
#   Project = "Terraform-Module-Demo"
#   Owner   = "Rakesh"
# }
ami           = "ami-0522ab6e1ddcc7055"
instance_type = "t2.micro"
instance_name = "rakesh-ec2"
owner         = "Rakesh"

azs = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs = ["172.31.1.0/24", "172.31.2.0/24"]

tags = {
  Project = "Terraform-Single-EC2"
  Owner   = "Rakesh"
}
