# module "components"{
#     source = "../../terraform-roboshop-component"
#     component = var.component
#     rule_priority = var.rule_priority
# }

module "components"{
	for_each = var.components
	source = "git::https://github.com/Sreenivasulu18/terraform-roboshop-component.git?ref=main"
	component = eack.key
	rule_ptiority = each.value.rule_priority
}