provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0731becbf832f281e" # Ubuntu 22.04 for us-east-1
  instance_type = "t2.micro"
  key_name      = "my-key" # You’ll create this in next step

  tags = {
    Name = "TerraformAnsibleDemo"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/inventory"
  }
}


