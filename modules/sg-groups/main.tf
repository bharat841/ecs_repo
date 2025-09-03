# ---------------------------------
# Security Group
# ---------------------------------
resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  tags        = var.tags
}

# ---------------------------------
# CIDR-based Ingress Rules
# ---------------------------------
resource "aws_security_group_rule" "ingress_cidr" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if length(rule.cidr_blocks) > 0 }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this.id
  cidr_blocks       = each.value.cidr_blocks
}

# ---------------------------------
# SG-based Ingress Rules (from other SGs)
# ---------------------------------
locals {
  sg_ingress_rules = flatten([
    for idx, rule in var.ingress_rules : [
      for sg in rule.security_groups : {
        idx   = idx
        sg    = sg
        from  = rule.from_port
        to    = rule.to_port
        proto = rule.protocol
      }
    ]
  ])
}

resource "aws_security_group_rule" "ingress_sg" {
  for_each = { for r in local.sg_ingress_rules : "${r.idx}-${r.sg}" => r }

  type                     = "ingress"
  from_port                = each.value.from
  to_port                  = each.value.to
  protocol                 = each.value.proto
  security_group_id        = aws_security_group.this.id
  source_security_group_id = each.value.sg
}
# ---------------------------------
# Egress Rules
# ---------------------------------
resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  type              = "egress"
  from_port         = each.value.from_port    # Correct attribute
  to_port           = each.value.to_port      # Correct attribute
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this.id
  cidr_blocks       = each.value.cidr_blocks
}
