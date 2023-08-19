### General Variables ###
variable "domain_name" {
  type        = string
  description = "The domain name for the website."
  default     = "meusiterenanzin.com"
}

variable "r53_zone_id" {
  type        = string
  description = "The zone ID of the domain you are deploying to, you can get it from R53 DNS Dashboard"
  default     = "Z002051618M4QHG4VM3M6"
}

### EC2 Values ###
variable "instance_type" {
  type        = string
  description = "Define the EC2 Instance type for the ecs cluster"
  default     = "t3.micro"
}

### ECS ###
variable "container_image" {
  type        = string
  description = "Define what docker image will be deployed to the ECS task"
  default     = "nginx"
}


variable "accessKey" {
  type = string
  description = "acess key statica"
  default   = "AKIAZL47VXKAZWFGQE6F"
}

variable "secretKey" {
  type = string
  description = "Secret key statica"
  default   = "3sYk5cuJr69LuMDLVaMKc4wx1FBunp3YGWAMi9Bo"
}