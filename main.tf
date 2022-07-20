
# resource "aws_key_pair" "deployer" {
#   key_name   = "UBUNTU2.pem"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/WKL12Ww7EWuKirBs5kfnT4FG6TU2D9a6dxoNb7j+XljCuvubO//midnxRasWyaEauX0LpC7PPokRLFsy2aNPteq1gBRzdfcgnfgDTVcpxFo+0d4XrK64u5oc9nNXmg0YzqOI4kQ2QaLBc6NB/5qjN1IS72PRYjVG1hHUy9evV7liIIBKQcQ/zDDsuab1W4v1VNkd7TI9WTSeNyHB+12IRuumd63rBj2vuiy0DBh9eQj/c60BnuCX5w7LXv6GRyFyS3kYm6NohGf5y72dcTZPRQTBSFI3DaI1APRL0lf3kcwL1jSiI2qfEOcet0jk7C041ZqVmFXw99AaRsG1DQQcis6WjRwNGAYk6OirYadE3eOrNKDj09NwuDFWL/KvEOqA1MQwEfzVNxCJ5RjjqC9tO5dFC1EbburW5K/OKlpL+RB1R2TEskP7twfFpKyqV1Hi7w91XChHga97TwsjABz3GzFr8Bu1tKG9s5jFAOFXuN2sZ2rzOPupx9N2udQuxQc= root@DESKTOP-AKKC1GS"

# }

resource "aws_instance" "webserver" {
  ami             = "ami-052efd3df9dad4825"
  # count = 2
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.projectSG.id}"]
  availability_zone = "us-east-1d"
  key_name        = "UBUNTU2"
  tags = { 

    Name = "webserver"

  }
}

resource "aws_instance" "database" {
  ami             = "ami-052efd3df9dad4825"
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.projectSG.id}"]
  availability_zone = "us-east-1d"
  key_name        = "UBUNTU2"
  tags = { 

    Name = "database"

  }
}