resource "aws_instance" "web" {
  ami           = data.aws_ami.ami_info.image_id
  instance_type = "t3.micro"
  key_name = aws_key_pair.terraform.key_name

  tags = {
    Name = "myfirst"
  }
}

resource "aws_key_pair" "terraform" {
  key_name   = "bharathterraform.pub"
  # this file function will read the  terraform.pub and fetch the content and help us to login to ec2 instance
  public_key = file("${path.module}/bharathterraform.pub")

}