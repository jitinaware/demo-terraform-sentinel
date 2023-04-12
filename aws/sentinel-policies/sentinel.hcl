
policy "restrict-ec2-instance-types" {
  source = "./restrict-ec2-instance-types/restrict-ec2-instance-types.sentinel"
  enforcement_level = "hard-mandatory"
}


policy "enforce-cost-control" {
  source = "./enforce-cost-control/enforce-cost-control.sentinel"
  enforcement_level = "soft-mandatory"
}