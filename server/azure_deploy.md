# Deploying MarketHub API to Azure App Service

This guide explains how to deploy the backend to Azure using the **Azure Student Pack**.

## Prerequisites
- Azure Account (with Student credits)
- Azure CLI installed (`az login`)
- Node.js LTS

## Deployment Steps

### 1. Create Web App
Use the Azure portal or CLI to create a "Web App" targeting **Node.js 20 LTS** on Windows/Linux.

```bash
az webapp up --name markethub-api --resource-group markethub-rg --sku F1 --plan markethub-plan
```

### 2. Configure Environment Variables
In the Azure Portal, go to **Settings > Configuration** and add:
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `JWT_SECRET`
- `PORT` (Azure usually sets this automatically)

### 3. Continuous Integration
Link your GitHub repository to the Azure Web App via the **Deployment Center** for automatic updates on every `git push`.

## Azure Student Pack Tip
> [!TIP]
> Use the **F1 (Free)** or **B1 (Basic)** tier to ensure you stay within your student credits.
