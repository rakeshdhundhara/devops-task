
# module "rakesh_vpc" {
#   source              = "./modules/network"
#   azs                 = var.azs
#   public_subnet_cidrs = var.public_subnet_cidrs
#   tags                = var.tags
# }

# module "ec2" {
#   source   = "./modules/ec2_jenkins"
#   for_each = var.inst

#   ami           = each.value.ami
#   instance_type = each.value.instance_type
#   instance_name = each.value.instance_name
#   subnet_id     = module.rakesh_vpc.public_subnet_ids[0] # pick first public subnet
#   owner         = each.key
#   vpc_id        = module.rakesh_vpc.vpc_id
# }

module "rakesh_vpc" {
  source              = "./modules/network"
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
  tags                = var.tags
}

module "ec2" {
  source        = "./modules/ec2_jenkins"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_id     = module.rakesh_vpc.public_subnet_ids[0] # first public subnet
  owner         = var.owner
  vpc_id        = module.rakesh_vpc.vpc_id
}
