# MarketHub Azure Deployment Script (F1 Free Tier) 🚀

# 1. Login to Azure
az login

# 2. Create a Resource Group (if not exists)
$RG="MarketHub-RG"
$LOC="eastus" # or your preferred region
az group create --name $RG --location $LOC

# 3. Create an App Service Plan (F1 FREE Tier)
$PLAN="MarketHub-Plan"
az appservice plan create --name $PLAN --resource-group $RG --sku F1 --is-linux

# 4. Create the Web App
$APP_NAME="markethub-server-" + (Get-Random -Minimum 1000 -Maximum 9999)
az webapp create --name $APP_NAME --resource-group $RG --plan $PLAN --runtime "NODE:18-lts"

# 5. Set Environment Variables (The "Benefits")
az webapp config appsettings set --name $APP_NAME --resource-group $RG --settings `
    PORT=8080 `
    DB="your_cosmos_db_mongodb_url" `
    JWT_SECRET="your_secret" `
    AZURE_VISION_KEY="your_key" `
    AZURE_VISION_ENDPOINT="your_endpoint" `
    AZURE_STORAGE_CONNECTION_STRING="your_connection_string"

# 6. Deploy Code
az webapp up --name $APP_NAME --resource-group $RG

Write-Host "✅ Deployment Complete! Your server is live at: https://$APP_NAME.azurewebsites.net" -ForegroundColor Green
