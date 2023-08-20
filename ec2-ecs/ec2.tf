data "template_file" "user_data" {
  template = file("user_data.tpl") #Defines a script that runs when the EC2 instance starts
}

resource "aws_autoscaling_group" "tf" {
  desired_capacity    = 1   #set to what you like; must be same number as min
  max_size            = 1   #set to what you like
  min_size            = 1   #set to what you like; must be same as desired capacity
  vpc_zone_identifier = [module.vpc.public_subnets[0], module.vpc.public_subnets[1],module.vpc.public_subnets[2]]   #two subnets

  launch_template {
    id      = aws_launch_template.tf_launch_template3.id
    version = "$Latest"
  }

 health_check_type    = "ELB"
  load_balancers = [aws_lb.loadbalancer.id]
  target_group_arns = [aws_alb_target_group.alb_public_webservice_target_group.arn]

    lifecycle {
    create_before_destroy = true
  }


}

## In the future change the security group of instance to talk
#  only with LB

resource "aws_launch_template" "tf_launch_template3" {
  name_prefix            = "tf-launch_template"
  image_id               = var.image_id                 #in variable file
  instance_type          = var.instance_type            #in variable file
  
  user_data = base64encode(file("user_data.sh"))
  #vpc_security_group_ids    = [aws_security_group.public.id]

    iam_instance_profile {
    name = aws_iam_instance_profile.ecs_agent.name
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups = [aws_security_group.public.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "terraform_auto_scaling"
    }
  }
}