module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"

  instance_type          = "t3.large"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  # convert StringList to list and get first element
  subnet_id = local.public_subnet_id
  ami = data.aws_ami.ami_info.id
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}
resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.selected.zone_id
  allow_overwrite = true
  name    = "bastion.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [module.bastion.public_ip]
}
