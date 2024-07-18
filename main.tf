provider "azurerm" {
  features {}
  
  subscription_id = "your-subscription-id"
  client_id       = "your-client-id"
#  client_secret   = "your-client-secret" # Uncomment this line and add your client secret
  tenant_id       = "your-tenant-id"
}

resource "azurerm_resource_group" "kong" {
  name     = "aks-api-resource-group"
  location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "kong" {
  name                = "aks-api-cluster"
  location            = azurerm_resource_group.kong.location
  resource_group_name = azurerm_resource_group.kong.name
  dns_prefix          = "kong-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}

provider "kubernetes" {
  config_path    = "C:\\Users\\Leandro\\.kube\\config"
  config_context = "my-context"
}


resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool_api" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kong.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kong.kube_config_raw
  sensitive = true
}

resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.kong.kube_config_raw
  filename = "kubeconfig"
}
