module "db"{
    source = "../../terraform-aws-securitygroups"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for DB MySQL Instances"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_name = "db"
}