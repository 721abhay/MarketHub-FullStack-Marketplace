# Technology Stack Diagram

```mermaid
graph TD
    subgraph Frontend [Mobile Frontend]
        F1[Flutter SDK]
        F2[Dart Language]
        F3[Provider - State Management]
        F4[Material Design - UI Components]
    end

    subgraph Backend [Backend API]
        B1[Node.js - Runtime]
        B2[Express.js - Web Framework]
        B3[Mongoose - ORM]
        B4[JWT - Authentication]
        B5[Cloudinary - Image Storage]
        B6[Morgan/Winston - Logging]
    end

    subgraph Database [Persistence Layer]
        D1[(MongoDB / Azure Cosmos DB)]
    end

    subgraph DevOps [Infrastructure & Deployment]
        V1[Docker - Containerization]
        V2[Azure Web Apps]
        V3[Azure ACR - Container Registry]
    end

    Frontend --> Backend
    Backend --> Database
    Backend --> B5
```

## Detailed Breakdown

### Frontend
- **Framework**: Flutter (Cross-platform)
- **State Management**: Provider
- **Networking**: Http (Dio conceptually)
- **Theming**: Dynamic Dark/Light Mode

### Backend
- **Platform**: Node.js
- **Framework**: Express.js
- **Authentication**: JWT (Stateless)
- **Security**: Helmet, Rate Limiting, CORS

### Database
- **Primary**: MongoDB (via Azure Cosmos DB)
- **Storage**: Cloudinary for product and user images

### Deployment
- **Container**: Docker
- **Cloud**: Azure
- **CI/CD**: Git based workflows
