module "jenkins-master" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "jenkins-master-${terraform.workspace}"
  instance_count         = 1

  ami                    = "ami-0885b1f6bd170450c"
  instance_type          = "t2.medium"
  key_name               = "jenkins-instance-keypair"
  vpc_security_group_ids = [module.jenkins_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              =    <<EOF

                                #!/bin/bash
                                wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key |  apt-key add -
                                echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list
                                apt-get update
                                apt-get install openjdk-8-jdk jenkins -y
                                systemctl start jenkins
                                systemctl status jenkins
                                ufw allow 8080
                                ufw status
                                ufw enable
                                ufw status
                                EOF
  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}

module "jenkins-slave" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "jenkins-slave-${terraform.workspace}"
  instance_count         = 1

  ami                    = "ami-0885b1f6bd170450c"
  instance_type          = "t2.medium"
  key_name               = "jenkins-instance-keypair"
  vpc_security_group_ids = [module.jenkins_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              =  <<EOF
                              #!/bin/bash
                              apt-get update
                              apt-get install openjdk-8-jdk jenkins -y
                                
                              EOF

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}

