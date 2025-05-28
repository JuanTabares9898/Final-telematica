provider "aws" {
  region = "us-east-1"
}


resource "aws_key_pair" "my_key" {
  key_name   = "mi-llave-ec2"  # Nombre que le das a la llave
  public_key = file("~/.ssh/id_rsa.pub")  # Ruta a tu llave pública local (tienes que tener una)
}


resource "aws_security_group" "rdp_sg" {
  name        = "allow_rdp"
  description = "Permite RDP desde cualquier IP"

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Para permitir desde cualquier IP (puedes restringir)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "windows_server" {
  ami           = "ami-0c2b8ca1dad447f8a"  # Windows Server 2019 Base en us-east-1
  instance_type = "t2.micro"

  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.rdp_sg.id]

  tags = {
    Name = "WindowsServerTerraform"
  }
}
