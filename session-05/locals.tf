locals {

    instance_name = join("-",[var.instance_name,var.environment]) # it will join two variables defined in varibales.tf
}