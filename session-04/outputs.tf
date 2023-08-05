output "ip_address"{ 
    value = aws_instance.web.public_ip
}

output "ami_id" {
    value = data.aws_ami.ami_info.image_id
}

output "current_region" {  # This will fetch the info regarding your current region.

    #value = data.aws_region.current -- this is used to fetch the commplete region details
    # the below code will fetch the particular region name
    value = data.aws_region.current.name
    
}

output "vpc_info" {
 value = data.aws_vpc.existing_vpc
 }