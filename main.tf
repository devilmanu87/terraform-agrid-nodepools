
locals {
  aks_resourcegroup  = "${var.prefix}-${var.locationcode}-${var.environment}-${var.application}-rg-${var.cluster_code}"
  aks_clustername    = "${var.prefix}-${var.locationcode}-${var.environment}-${var.application}-aks-${var.cluster_code}"
}

data "azurerm_virtual_network" "vnet" {
  name                = var.aks_vnet_name
  resource_group_name = var.aks_vnet_rg
}

data "azurerm_subnet" "aks_snet" {
  name                 = var.aks_snet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = local.aks_clustername
  resource_group_name = local.aks_resourcegroup
}

module "tf_aks_repo" {
  #source           = "git::https://azgithub.ops.crd.com/CPE-Terraform/trf-az-aks.git?ref=master"
  source           = "git::https://azgithub.ops.crd.com/Alpha-Grid-Platform-Engineering/trf-agrid-az-aks.git"
}  

module "aks_usernode_pool" {
  source                   = "./.terraform/modules/tf_aks_repo/azure-aks-userpool-notaints"
  for_each                = var.user_nodepools

  orchestrator_version    = var.orchestrator_version 
  unp_name                = each.value.unp_name
  rg_name                 = local.aks_resourcegroup
  aks_id                  = data.azurerm_kubernetes_cluster.aks.id
  snet_id                 = data.azurerm_subnet.aks_snet.id  
  unp_vm_size             = each.value.unp_vm_size
  unp_node_count          = each.value.unp_node_count
  unp_node_labels         = each.value.unp_node_labels
  unp_availability_zones  = [1, 2, 3]
}

module "aks_taint_usernode_pool" {
  source                   = "./.terraform/modules/tf_aks_repo/azure-aks-userpool"
  for_each                = var.taint_user_nodepools

  orchestrator_version    = var.orchestrator_version 
  unp_name                = each.value.unp_name
  rg_name                 = local.aks_resourcegroup
  aks_id                  = data.azurerm_kubernetes_cluster.aks.id
  snet_id                 = data.azurerm_subnet.aks_snet.id  
  unp_vm_size             = each.value.unp_vm_size
  unp_node_count          = each.value.unp_node_count
  unp_node_labels         = each.value.unp_node_labels
  unp_node_taints         = each.value.unp_node_taints
  unp_availability_zones  = [1, 2, 3]
}

module "aks_usernode_autoscale_pool" {
  source                  = "./.terraform/modules/tf_aks_repo/azure-aks-userpool-notaints-autoscale"
  for_each                = var.autoscale_user_nodepools

  orchestrator_version    = var.orchestrator_version 
  unp_name                = each.value.unp_name
  rg_name                 = local.aks_resourcegroup
  aks_id                  = data.azurerm_kubernetes_cluster.aks.id
  snet_id                 = data.azurerm_subnet.aks_snet.id  
  unp_vm_size             = each.value.unp_vm_size
  unp_node_count          = each.value.unp_node_count
  unp_min_count           = each.value.unp_min_count
  unp_max_count           = each.value.unp_max_count
  unp_node_labels         = each.value.unp_node_labels
  unp_availability_zones  = [1, 2, 3]
}

module "aks_taint_usernode_autoscale_pool" {
  source                  = "./.terraform/modules/tf_aks_repo/azure-aks-userpool-autoscale"
  for_each                = var.autoscale_taint_user_nodepools

  orchestrator_version    = var.orchestrator_version 
  unp_name                = each.value.unp_name
  rg_name                 = local.aks_resourcegroup
  aks_id                  = data.azurerm_kubernetes_cluster.aks.id
  snet_id                 = data.azurerm_subnet.aks_snet.id  
  unp_vm_size             = each.value.unp_vm_size
  unp_node_count          = each.value.unp_node_count
  unp_min_count           = each.value.unp_min_count
  unp_max_count           = each.value.unp_max_count
  unp_node_labels         = each.value.unp_node_labels
  unp_node_taints         = each.value.unp_node_taints
  unp_availability_zones  = [1, 2, 3]
}
