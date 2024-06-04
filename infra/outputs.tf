output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "security_group_ids" {
  value = module.network.security_group_ids
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "instance_private_ip" {
  value = module.ec2.instance_private_ip
}

output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}
