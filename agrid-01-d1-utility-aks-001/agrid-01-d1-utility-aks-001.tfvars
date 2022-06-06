####################################################################################################################################
#################################### AKS Cluster input Variables Section ###########################################################
###### Note: Pay attention to these variables,these will be used to decided the AKS resources naming convention ####################
####################################################################################################################################
# AKS Variables
# Resource Locations
location = "eastus"

# Product Prefix
prefix = "agrid"

# Resource Location code
locationcode = "01"

# Environment
environment = "d1"

#hub/spk/svc
subscription_zone = "hub"

#svc/crd/transit
subscription_module = "svc"

# Application
application = "utility"
application_short = "util"

# Application Sequence#
cluster_code = "001"

# AKS Node version
#"1.19.11" - current
#"1.20.15" - interim
#"1.21.9"  - desired
orchestrator_version   = "1.21.9"

####################################################################################################################################
#################################### AKS Nodepool Resource Creation Variables Section ##############################################
########## Note: Change required the vairables under this section as per your need #################################################
####################################################################################################################################
user_nodepools = {
}

taint_user_nodepools = {
  elasticpool = {
    unp_name                = "elasticpool",
    unp_vm_size             = "Standard_D16s_v3",
    unp_node_count          = 6,    
    unp_node_labels         = { app = "elasticstack" }
    unp_node_taints         = ["sku=elastic:NoSchedule"]
  },
  ingestpool = {
    unp_name                = "ingestpool",
    unp_vm_size             = "Standard_D16s_v3",
    unp_node_count          = 3,    
    unp_node_labels         = { app = "ingest" }
    unp_node_taints         = ["sku=ingest:NoSchedule"]
  },
  generalpool = {
    unp_name                = "generalpool",
    unp_vm_size             = "Standard_D8as_v4",
    unp_node_count          = 6,    
    unp_node_labels         = { app = "general" }
    unp_node_taints         = ["sku=general:NoSchedule"]
  },
  metricssvc = {
    unp_name                = "metricssvc",
    unp_vm_size             = "Standard_D16s_v4",
    unp_node_count          = 6,    
    unp_node_labels         = { app = "metricssvc" }
    unp_node_taints         = ["sku=metricssvc:NoSchedule"]
  }
}  

autoscale_user_nodepools = {  
}

autoscale_taint_user_nodepools = {  
}  

####################################################################################################################################
#################################### AKS Network Resource Variables Section ########################################################
########## Note: No changes required to the vairables under this section, unless directed by CPE Team ##############################
####################################################################################################################################
#VirtualNetowrk Details
aks_vnet_rg = "agrid-01-d1-hub-svc-rg-001"
aks_vnet_name = "agrid-01-d1-hub-svc-vnet-001"
aks_snet_name = "agrid-01-d1-util-snet-aks-001"

####################################################################################################################################
#################################### Azure Platform Immutable Variables Section ####################################################
########## Note: No changes required to the vairables under this section, unless directed by CPE Team ##############################
####################################################################################################################################
# CI/CD SP Credentials
#Subscription: agrid-01-d1-hub-sub-001
cicd_sp_subscription_id = "a786eb34-3c9e-4875-a35b-d91487d59d5c"
application_subscription_id = "a786eb34-3c9e-4875-a35b-d91487d59d5c"
#cicd_SPN_Name: agrid-cpe-d1-aks-rw-cicd-spn-01"
cicd_sp_client_id     = "f9fc4ebb-0b04-4820-8f04-f6f9f590e054"
cicd_sp_client_secret = "ABbK-NDJ-********"
cicd_sp_tenant_id     = "f7d9f3f1-3841-4bfc-9cd4-c0e1964b5f86"
