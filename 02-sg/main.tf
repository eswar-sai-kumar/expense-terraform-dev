module "db"{
    source = "git::https://github.com/eswar-sai-kumar/terraform-aws-securitygroups.git"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "db"
    sg_description = "SG for DB MySQL Instances"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}
module "backend"{
    source = "git::https://github.com/eswar-sai-kumar/terraform-aws-securitygroups.git"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "backend"
    sg_description = "SG for backend instances"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}
module "frontend"{
    source = "git::https://github.com/eswar-sai-kumar/terraform-aws-securitygroups.git"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "frontend"
    sg_description = "SG for frontend instances"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}

# db is accepting connections from backend
resource "aws_security_group_rule" "db_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend.sg_id
  security_group_id = module.db.sg_id
}

# backend is accepting connections from frontend
resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend.sg_id
  security_group_id = module.backend.sg_id
}

# frontend is accepting connections from public
resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.frontend.sg_id
}
