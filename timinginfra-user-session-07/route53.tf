
#i wamt my records to be redirecting to  api.mokguru.com 
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name
  records = [
    {
      name    = var.api_alb_record_name
      type    = "A"
      alias   = {
        name    = local.api_alb_dns_name  #loadbalancer dns name 
        zone_id = local.api_alb_zone_id        ##loadbalancer hostedzoneid
      }
    }
  ]
}
