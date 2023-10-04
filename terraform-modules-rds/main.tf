resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name #"mydb"
  engine               = var.engine
  identifier = var.identifier
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  username = var.username
  db_subnet_group_name = var.db_subnet_group_name
  password = random_password.password.result
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = merge (
    var.tags,
    var.rds_tags
  )


}

resource "random_password" "password" {    #this is to generate the random password
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}




#store the password in secretes manager . This way is to create a secret by terraform

# resource "aws_secretsmanager_secret" "rds" {   # This is to provide the secrete name
#   name = var.secret_name #user has to provide the secrete name
#   tags = merge (
#     var.tags,
#     var.rds_tags
#   )

# }
# This is another way to fetch the secret by using datasource . it will fetch the secret from aws secret
data "aws_secretsmanager_secret" "rds_secret_arn" {
  arn = var.rds_secret_arn
  
}

# we will create the secret outside of terraform (aws secret) .But we store the value through terraform
resource "aws_secretsmanager_secret_version" "rds" {
  secret_id     = data.aws_secretsmanager_secret.rds_secret_arn.id     #this is to retreive the secrete id from the above datasource
  secret_string = random_password.password.result          # this is to get the random password.

}