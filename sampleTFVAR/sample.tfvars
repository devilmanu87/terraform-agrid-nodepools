####################################################################################################################################
#################################### AKS Cluster input Variables Section ###########################################################
###### Note: Pay attention to these variables,these will be used to decided the AKS resources naming convention ####################
####################################################################################################################################
# AKS Variables
# Resource Locations
location = "eastus2"

# Product Prefix
prefix = "ihub"

# Resource Location code
locationcode = "06"

# Environment
environment = "d1"

#hub/spk/svc
subscription_zone = "spk"

#svc/crd/transit
subscription_module = "svc"

# Application
application = "spoke2"
application_short = "spk"

# Application Sequence#
cluster_code = "001"

#VirtualNetowrk Details
aks_vnet_rg = "ihub-06-d1-spk-rg-001"
aks_vnet_name = "ihub-06-d1-spk-vnet-001"
aks_snet_name = "ihub-06-d1-snet-aks-001"
application_subscription_id = "df758666-6153-4558-9eb8-1b76b98d8d3e"

####################################################################################################################################
#################################### AKS New Resource Creation Variables Section ###################################################
########## Note: Change required the vairables under this section as per your need #################################################
####################################################################################################################################
user_nodepools = {
}

taint_user_nodepools = {  
}  

autoscale_user_nodepools = {
  appsvc = {
    unp_name                = "appsvc",
    unp_vm_size             = "Standard_E4s_v4",
    unp_node_count          = 1,
    unp_min_count           = 1,
    unp_max_count           = 5,
    unp_node_labels         = { app_pool: "appsvc" }    
  }
}

autoscale_taint_user_nodepools = {  
}  

####################################################################################################################################
#################################### Azure Platform Immutable Variables Section ####################################################
########## Note: No changes required to the vairables under this section, unless directed by CPE Team ##############################
####################################################################################################################################
azure_tenant_id     = "f7d9f3f1-3841-4bfc-9cd4-c0e1964b5f86"

# CI/CD SP Credentials
# cicd_sp_display_name    = "agrid-cpe-d1-aks-rw-cicd-spn-01"
cicd_sp_client_id     = "f9fc4ebb-0b04-4820-8f04-f6f9f590e054"
#cicd_sp_client_secret = "" #Value supplied as ENV variables before running Terraform
