## OUTPUTS

we are creating infra, we want to see what are the outputs we can get through infra.
syntax is 
'''''''''

output "name you prefer" {
    value = ""
}

## Data sources

Data sources is useful to get the information from cloud or any external provider.(In simple words data source is useful to fetch the data from the cloud providers ex: AWS )
This information will be used as inputs for your infrastructure.

sytax:

data "type_of_data_source""preferred_name" {

}

## functions

Functions are nothing but a unit of work. you can use fucntions repeatdly wherever you want.

** lookup functions
** merge functions
