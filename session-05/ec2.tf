# #our requirement is to create 3 instances web-server , app-server, db-server
# resource "aws_instance" "web-1" {
#   ami           = "ami-08e5424edfe926b43" # AMI will be different in every region
#   instance_type = "t3.micro"
#   #count = 3 instead of assiginig count value we can use the below code it will count automatically from 
#   #variables we define in defaut section ex: default = ["web-server", "app-server", "db-server"]
#   count = length(var.instances)


#   tags = {
#     Name = var.instances[count.index] # index always starts from 0. if size is 3 it starts from 0,1,2
#   }
# }

#condition is if variable of key is defined then use that, otherwise use default key

# resource "aws_instance" "web" {
#   ami           = "ami-08e5424edfe926b43" # AMI will be different in every region
#   instance_type = "t3.micro"
#   count = 0 # if count is equal to zero terraform will not create the resource
# }

# resource "aws_instance" "web" {
#   ami           = "ami-08e5424edfe926b43" # AMI will be different in every region
#   instance_type =  var.is_test ? "t3.micro": "t3.large"  #condition ? true_val : false_val

# }

# resource "aws_instance" "web" {
#   for_each = var.servers # here you need to give a map to iterate
#   ami           = "ami-08e5424edfe926b43" # AMI ID will be different in every region
#   instance_type =  each.value #it will go with the map step by step value ex:t3.micro , medium, large
#   tags = {
#     Name = each.key           # it will fetch the map varible of key web. app, db-servers
#   }

# }

resource "aws_instance" "web" {
  ami           = "ami-08e5424edfe926b43" # AMI ID will be different in every region
  instance_type = "t3.micro" #it will go with the map step by step value ex:t3.micro , medium, large
  tags = {
    Name = local.instance_name
  }

}