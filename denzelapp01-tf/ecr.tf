resource "aws_ecr_repository" "ecrdenzel" {
  name                 = "ecrrepo2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

  # provisioner "local-exec" {
  #   command = <<-EOT
  #      aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${var.aws_account}.dkr.ecr.us-west-2.amazonaws.com
  #           EOT
  
  # depends_on = [aws_ecr_repository.ecrdenzel
  # }




