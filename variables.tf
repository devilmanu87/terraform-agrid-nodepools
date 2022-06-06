# Start CICD Service Principal

variable "application_subscription_id" {
  type        = string
  description = "application_subscription_id"
}


variable "cicd_sp_client_id" {
  type        = string
  description = "cicd_sp_client_id"
}


variable "cicd_sp_client_secret" {
  type        = string
  description = "cicd_sp_client_secret"
}


variable "cicd_sp_tenant_id" {
  type        = string
  description = "cicd_sp_tenant_id"
}

variable "orchestrator_version" {
  type        = string
  description = "orchestrator_version"
}


variable "prefix" {
  type        = string
  description = "Prefix"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "locationcode" {
  type        = string
  description = "Location code of the resource group"
}

variable "environment" {
  type        = string
  description = "environment"
}

variable "application" {
  type        = string
  description = "application"
}

variable "cluster_code" {
  type        = string
  description = "cluster_code"
}

variable "vnet_name" {
  type        = string
  description = "Name of VNET"
  default     = ""
}

variable "application_short" {
  type        = string
  description = "application_short"
}

variable "subscription_zone" {
  type        = string
  description = "subscription_zone"
}

variable "subscription_module" {
  type        = string
  description = "subscription_module"
}

variable "user_nodepools" {
  description = "List of User pools to be created"
  type        = map
}

variable "taint_user_nodepools" {
  description = "List of User pools to be created with taints"
  type        = map
}

variable "autoscale_user_nodepools" {
  description = "List of User pools to be created with Autoscale"
  type        = map
}

variable "autoscale_taint_user_nodepools" {
  description = "List of User pools to be created with taints and autoscale"
  type        = map
}


#################################### AKS Network Resource Variables Section ########################################################

variable "aks_vnet_rg" {
  type        = string
  description = "Virtual Network RG Name"
}

variable "aks_vnet_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "aks_snet_name" {
  type        = string
  description = "Virtual SubNetwork Name"
}
