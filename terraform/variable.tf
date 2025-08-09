#################################################
# common
#################################################








#################################################
# vpc
#################################################


# vpc cidr
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

# vpc vpc_name
variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "my-vpc"
}

# vpc az ap-northeast-1
variable "azs" {
  type        = list(string)
  description = "VPC AZ ap-northeast-1"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}



#################################################
# ec2
#################################################





#################################################
# codebuild
#################################################