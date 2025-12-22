# Frontend accepting traffic from frontend ALB
# backend ALB accepting traffic from bastion 
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id # backend ALB SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

# bastion accepting traffic from laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# mongodb accepting traffic from bastion
resource "aws_security_group_rule" "mongodb_bastion" {  
  type              = "ingress"
  security_group_id = local.mongodb_sg_id  # mongodb SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# redis accepting traffic from bastion
resource "aws_security_group_rule" "redis_bastion" {  
  type              = "ingress"
  security_group_id = local.redis_sg_id  # redis SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# rabbitmq accepting traffic from bastion
resource "aws_security_group_rule" "rabbitmq_bastion" {  
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id  # rabbitmq SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# mysql accepting traffic from bastion
resource "aws_security_group_rule" "mysql_bastion" {  
  type              = "ingress"
  security_group_id = local.mysql_sg_id  # mysql SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# mysql accepting traffic from bastion
resource "aws_security_group_rule" "catalogue_bastion" {  
  type              = "ingress"
  security_group_id = local.catalogue_sg_id  # mysql SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# mongodb accepting traffic from catalogue
resource "aws_security_group_rule" "mongodb_catalogue" {  
  type              = "ingress"
  security_group_id = local.mongodb_sg_id  # mysql SG ID
  source_security_group_id = local.catalogue_sg_id # bastion SG ID
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

# catalogue  accepting traffic from backend_alb
resource "aws_security_group_rule" "catalogue_backend_alb" {  
  type              = "ingress"
  security_group_id = local.catalogue_sg_id  # catalogue SG ID
  source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol       = "tcp"
  to_port           = 443
}

# mongodb accepting traffic from user
resource "aws_security_group_rule" "mongodb_user" {  
  type              = "ingress"
  security_group_id = local.mongodb_sg_id  # mongodb SG ID
  source_security_group_id = local.user_sg_id # user SG ID
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

resource "aws_security_group_rule" "redis_user" {  
  type              = "ingress"
  security_group_id = local.redis_sg_id  # redis SG ID
  source_security_group_id = local.user_sg_id # user SG ID
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "redis_cart" {  
  type              = "ingress"
  security_group_id = local.redis_sg_id  # redis SG ID
  source_security_group_id = local.cart_sg_id # cart SG ID
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "mysql_shipping" {  
  type              = "ingress"
  security_group_id = local.mysql_sg_id  # mysql SG ID
  source_security_group_id = local.shipping_sg_id # shipping SG ID
  from_port         = 3306
  protocol       = "tcp"
  to_port           = 3306
}

resource "aws_security_group_rule" "rabbitmq_payment" {  
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id  # rabbitmq SG ID
  source_security_group_id = local.payment_sg_id # shipping SG ID
  from_port         = 5672
  protocol       = "tcp"
  to_port           = 5672
}

resource "aws_security_group_rule" "user_backend_alb" {  
  type              = "ingress"
  security_group_id = local.user_sg_id  # catalogue SG ID
  source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "cart_backend_alb" {  
  type              = "ingress"
  security_group_id = local.cart_sg_id  # cart SG ID
  source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "shipping_backend_alb" {  
  type              = "ingress"
  security_group_id = local.shipping_sg_id  # shipping SG ID
  source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "payment_backend_alb" {  
  type              = "ingress"
  security_group_id = local.payment_sg_id  # payment SG ID
  source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "catalogue_cart" {  
  type              = "ingress"
  security_group_id = local.catalogue_sg_id  # payment SG ID
  source_security_group_id = local.cart_sg_id # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "cart_shipping" {  
  type              = "ingress"
  security_group_id = local.cart_sg_id  # payment SG ID
  source_security_group_id = local.shipping_sg_id  # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "user_payment" {  
  type              = "ingress"
  security_group_id = local.user_sg_id  # payment SG ID
  source_security_group_id = local.payment_sg_id  # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "cart_payment" {  
  type              = "ingress"
  security_group_id = local.cart_sg_id  # payment SG ID
  source_security_group_id = local.payment_sg_id  # backend_alb SG ID
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "backend_alb_frontend" {  
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id  # payment SG ID
  source_security_group_id = local.frontend_sg_id  # backend_alb SG ID
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "frontend_frontend_alb" {  
  type              = "ingress"
  security_group_id = local.frontend_sg_id  # payment SG ID
  source_security_group_id = local.frontend_alb_sg_id  # backend_alb SG ID
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "user_bastion" {  
  type              = "ingress"
  security_group_id = local.user_sg_id  
  source_security_group_id = local.bastion_sg_id 
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "cart_bastion" {  
  type              = "ingress"
  security_group_id = local.cart_sg_id  
  source_security_group_id = local.bastion_sg_id 
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "shipping_bastion" {  
  type              = "ingress"
  security_group_id = local.shipping_sg_id  
  source_security_group_id = local.bastion_sg_id 
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "payment_bastion" {  
  type              = "ingress"
  security_group_id = local.payment_sg_id  
  source_security_group_id = local.bastion_sg_id 
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "frontend_bastion" {  
  type              = "ingress"
  security_group_id = local.frontend_sg_id  
  source_security_group_id = local.bastion_sg_id 
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}