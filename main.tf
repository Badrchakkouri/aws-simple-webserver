//Serving a custom web page in AWS

//--------------------------------------Methode 1: using AWS lightsail Service------------------------------------------
//this is a managed service from AWS used to host websites
//the URL will be printed out after running terraform or it can be retrived from AWS Lighsail web console

resource "aws_lightsail_instance" "custom_webpage" {
  availability_zone = "eu-west-1a"
  blueprint_id = "nginx_1_14_0_1" // this is to specify the webserver we want to work with. More about this in AWS doc.
  bundle_id = "nano_2_0" // type of the machine (resources: cpu and ram)
  name = "custom_webpage"
  user_data = file("./starterLS.sh") // calling the startup script which will provision the web page
}


//---------------------------------------Methode 2: using AWS EC2 instnace-----------------------------------------------
//in this section I'm building an EC2 instance that will serve the web page using nginx
//the EC2 instance will get a public IP that will be used to access the webpage. This will be prited out after running terraform

//first I need to create a security group in which I allow http as ingress and anything in egress.
resource "aws_security_group" "web_server_secgp" {
}

//http ingress rule
resource "aws_security_group_rule" "allow_traffic_to_port_8080" {
  from_port = 80
  protocol = "TCP"
  security_group_id = aws_security_group.web_server_secgp.id
  to_port = 80
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

//anything egress rule
resource "aws_security_group_rule" "allow_traffic_to_outbound" {
  from_port = 0
  security_group_id = aws_security_group.web_server_secgp.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "-1" // this means any protocol
}

//the instance declaration
resource "aws_instance" "web_server" {
  ami = var.ami-id //varialble ami-id contains debial-10 image id, this is available in debian's wiki
  instance_type = var.ec2-size
  vpc_security_group_ids = [aws_security_group.web_server_secgp.id]
  user_data = file("./starterEC2.sh") // here I'm calling the startup script to install nginx and serve my custom web page
}