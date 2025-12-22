variable "component"{
    default = "catalogue"
}

variable "rule_priority" {
    default = 10
}

# variable "component"{
#     default = {
#         catalogue = {
#             default = 10
#         }
#         user = {
#             default = 20
#         }
#         cart = {
#             default = 30
#         }
#         shipping = {
#             default = 40
#         }
#         payment = {
#             default = 20
#         }
#         frontend = {
#             default = 10
#         }
#     }
# }