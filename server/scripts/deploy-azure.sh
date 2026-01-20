#!/bin/bash
# MarketHub Azure Deployment Script (F1 Free Tier) 🚀

# 1. Login
az login

# 2. Setup Variables
RG="MarketHub-RG"
LOC="eastus"
PLAN="MarketHub-Plan"
APP_NAME="markethub-server-$RANDOM"

# 3. Create Group & Plan
az group create --name $RG --location $LOC
az appservice plan create --name $PLAN --resource-group $RG --sku F1 --is-linux

# 4. Create Web App
az webapp create --name $APP_NAME --resource-group $RG --plan $PLAN --runtime "NODE:18-lts"

# 5. Set Env Vars
az webapp config appsettings set --name $APP_NAME --resource-group $RG --settings \
    PORT=8080 \
    DB="your_cosmos_db_mongodb_url" \
    JWT_SECRET="your_secret" \
    AZURE_VISION_KEY="your_key" \
    AZURE_VISION_ENDPOINT="your_endpoint" \
    AZURE_STORAGE_CONNECTION_STRING="your_connection_string"

# 6. Deploy
az webapp up --name $APP_NAME --resource-group $RG

echo "✅ Deployment Complete! Your server is live at: https://$APP_NAME.azurewebsites.net"
