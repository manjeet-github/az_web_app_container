resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.prefix}-workshop"
  location = "${var.location}"
}

#-- From private Module Registry

module "web_app_container" {
  source = "app.terraform.io/YOURORGNAME/web-app-container/azurerm"
  name = "${var.prefix}"
  port = "80"
  htpps_only = "false"
  resource_group_name = "${azurerm_resource_group.myresourcegroup.name}"
  container_type = "docker"
  container_image = "scarolan/palacearcade"
}

output "container_app_url" {
  value = "http://${module.web_app_container.hostname}"
}
