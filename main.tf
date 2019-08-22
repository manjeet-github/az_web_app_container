resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.prefix}-workshop"
  location = "${var.location}"
}
