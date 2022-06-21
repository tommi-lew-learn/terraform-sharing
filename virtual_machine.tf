# Doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami
data "aws_ami" "amazon_linux_2" {
  # Reference: https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#ImageDetails:imageId=ami-0c802847a7dd848c0
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220606.1-x86_64-gp2"]
  }

  # Reference: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

# Doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.nano"

  tags = {
    Name = "example-ec2"
  }
}

output "virtual_machine_public_ip" {
  value = aws_instance.web.public_ip
}

output "virtual_machine_public_dns" {
  value = aws_instance.web.public_dns
}
