provider  "azurerm"  {
    version = "2.42.0"
    features{}
}

resource "azurerm_resource_group" "rg_weatherapp" {
    name = "rg_weatherapp"
    location = "West Europe"
}

resource "azurerm_container_group" "cf_weatherapp"{
    name ="cf_weatherapp"
    location = azurerm_resource_group.rg_weatherapp.location
    resource_group_name = azurerm_resource_group.rg_weatherapp.name

    ip_address_type = "public"
    dns_name_label = "georgiansapi"
    os_type = "Linux"

    container {
        name = "cntweatherapi"
            image = "gepirvu/weatherapiimg"
            cpu = "1"
            memory = "1"

         ports {
                port = 80
                protocol = "TCP"

         }   
    }
}   

#testing part







