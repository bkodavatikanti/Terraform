variable "aws_accounts" {
 type = map
 default = {
    ap-south-1 = "099720109477" # these are offical aws account ids
    ap-south-2 = "140264529686"
 }
  
}

# how you get value from map is
# map_name("key")
#ex: aws_accounts["ap-south-1"]