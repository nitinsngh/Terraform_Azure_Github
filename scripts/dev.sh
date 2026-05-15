#!/bin/bash

RESOURCE_GROUP_NAME=terraform-state-rg01
STAGE_SA_ACCOUNT=tfstagebackend2026nitin
DEV_SA_ACCOUNT=tfdevbackend2026nitin
CONTAINER_NAME=tfstate


# Create resource group
az group create --name terraform-state-rg01 --location canadacentral

# Create storage account for staging environment
az storage account create --resource-group terraform-state-rg01 --name tfstagebackend2026nitin --sku Standard_LRS --encryption-services blob

# Create storage account for dev environment
az storage account create --resource-group terraform-state-rg01 --name tfdevbackend2026nitin --sku Standard_LRS --encryption-services blob

# Create blob container for staging environment
az storage container create --name tfstate --account-name tfstagebackend2026nitin

# Create blob container for dev environment
az storage container create --name tfstate --account-name tfdevbackend2026nitin