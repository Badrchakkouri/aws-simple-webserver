//these are the outputs that will be printed out after terraform completion

output "AWS-Lightsail-URL" {
  value = "http://${aws_lightsail_instance.custom_webpage.public_ip_address}"
}

output "EC2-URL" {
  value = "http://${aws_instance.web_server.public_ip}"
}

