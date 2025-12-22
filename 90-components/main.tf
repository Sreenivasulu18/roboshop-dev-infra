module "component"{
    source = "../terraform-roboshop-component"
    component = var.component
    rule_priority = var.rule_priority
}

module "component"{
	for_each = var.component
	source = "git::?ref=main"
	component = eack.key
	rule_ptiority = each.value. rule_priority
}