# resource "aws_network_acl" "virtega-nacl" {
#   vpc_id = module.vpc.vpc_id
#   egress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 443
#     to_port    = 443
#    }

#   ingress {
#         rule_no = 100
#         action = "allow"
#         from_port   = 80
#         to_port     = 80
#         protocol    = "tcp"
#         cidr_block  = "0.0.0.0/0"
#       }
#   ingress {
#         rule_no = 110
#         action = "allow"
#         from_port   = 443
#         to_port     = 443
#         protocol    = "tcp"
#         cidr_block  = "0.0.0.0/0"
#       }

#   tags = {
#     Name = "Virtega-NACl-${terraform.workspace}"
#   }
# }