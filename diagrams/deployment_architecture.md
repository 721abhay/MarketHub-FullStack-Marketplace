# Deployment Architecture Diagram

```mermaid
graph TD
    subgraph Local_Dev [Development Environment]
        Git[Git Repository]
    end

    subgraph Azure_Cloud [Azure Production Environment]
        ACR[Azure Container Registry]
        AWB[Azure Web App for Containers]
        CDB[(Azure Cosmos DB - MongoDB API)]
        CDN[Cloudinary Media Hosting]
    end

    Git -- Push --> ACR
    ACR -- Pull Image --> AWB
    AWB -- Query --> CDB
    AWB -- Upload/Serve --> CDN
```

## Infrastructure Specs

### 1. Azure Hosting
- Uses **App Service** for hosting the Dockerized Node.js application.
- Scalability is managed via App Service Plans (S1 or P1v2).

### 2. Database Integration
- **Cosmos DB with MongoDB API**: Provides a managed, high-availability database environment compatible with existing Mongoose code.

### 3. Media Distribution
- Images are not stored on the app server. They are uploaded to **Cloudinary**, which provides optimized delivery via their global Content Delivery Network (CDN).

### 4. Containerization
- The `Dockerfile` in the root of the server project defines the immutable runtime environment, ensuring parity between local dev and production.
