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
subscription_zone = "spk"

#svc/crd/transit
subscription_module = "crd"

# Application
application = "spoke1"
application_short = "spk"

# Application Sequence#
cluster_code = "001"

# AKS Node version
#"1.19.11" - current
#"1.20.15" - interim
#"1.21.9"  - desired
orchestrator_version   = "1.21.9"

####################################################################################################################################
#################################### AKS New Resource Creation Variables Section ###################################################
########## Note: Change required the vairables under this section as per your need #################################################
####################################################################################################################################
user_nodepools = {
  cpsvc = {
    unp_name                = "cpsvc",
    unp_vm_size             = "Standard_D8s_v4",
    unp_node_count          = 18,    
    unp_node_labels         = { app_pool: "cpsvc" }    
  },
  tenantsvc = {
    unp_name                = "tenantsvc",
    unp_vm_size             = "Standard_D64s_v4",
    unp_node_count          = 6,    
    unp_node_labels         = { app_pool: "tenantsvc" }    
  }
}

taint_user_nodepools = {  
  generalsvc = {
    unp_name                = "generalsvc",
    unp_vm_size             = "Standard_D8s_v4",
    unp_node_count          = 3,    
    unp_node_labels         = { app_pool = "generalsvc" }
    unp_node_taints         = ["sku=generalsvc:NoSchedule"]
  },
  metricssvc = {
    unp_name                = "metricssvc",
    unp_vm_size             = "Standard_D16s_v4",
    unp_node_count          = 9,    
    unp_node_labels         = { app_pool = "metricssvc" }
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
aks_vnet_rg = "agrid-01-d1-spk-crd-rg-001"
aks_vnet_name = "agrid-01-d1-spk-crd-vnet-001"
aks_snet_name = "agrid-01-d1-snet-aks-001"

####################################################################################################################################
#################################### Azure Platform Immutable Variables Section ####################################################
########## Note: No changes required to the vairables under this section, unless directed by CPE Team ##############################
####################################################################################################################################
# CI/CD SP Credentials
#Subscription: agrid-01-d1-hub-sub-001
cicd_sp_subscription_id = "4cdde026-a1dc-48ef-98be-b48892c3f96d"
application_subscription_id = "4cdde026-a1dc-48ef-98be-b48892c3f96d"
#cicd_SPN_Name: agrid-cpe-d1-aks-rw-cicd-spn-01"
cicd_sp_client_id     = "f9fc4ebb-0b04-4820-8f04-f6f9f590e054"
cicd_sp_client_secret = "ABbK-NDJ-***********"
cicd_sp_tenant_id     = "f7d9f3f1-3841-4bfc-9cd4-c0e1964b5f86"

####################################################################################################################################
#################################### Application specific required user nodepools ##################################################
####################################################################################################################################
# Create AKS Cluster User Pool
#userPools:
#cpSvcPool
# - kafka(22 pod in QA) - 12nodes(9broker,3zookeeper,1client=10)

#tenantSvcPool(open to all services for which the tolerations cannot be defined as of now)
# - ibor, datapipe, alpha portal, nginx/ambasaddor

#GeneralSvcPool
# - argocd, tracing, fleuntd, prometheous, litmus/chaos

#prometheus/MetricPool
# - prometheus, grafana
####################################################################################################################################
####################################################################################################################################
