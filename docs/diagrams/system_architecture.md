# System Architecture Diagram

```mermaid
graph TD
    Client[Flutter Mobile App]
    LB[Azure Load Balancer]
    API1[Node.js API Instance 1]
    API2[Node.js API Instance 2]
    DB[(Azure Cosmos DB / MongoDB)]
    CD[Cloudinary Image CDN]
    AI[OpenAI / AI Services]

    Client -- HTTPS/REST --> LB
    LB --> API1
    LB --> API2
    API1 --> DB
    API2 --> DB
    API1 --> CD
    API2 --> CD
    API1 --> AI
    Client -- Cached Images --> CD
```

## Component Roles

### 1. Flutter Mobile Application
Handles all presentation logic, local state management (Provider), and asynchronous API communication. Uses localized themes for premium UX.

### 2. Azure Infrastructure
- **Load Balancer**: Distributes incoming traffic across multiple API instances for high availability.
- **Web App for Containers**: Hosts the Dockerized Node.js environment.

### 3. Node.js Backend
A stateless REST API layer. It validates tokens, enforces rate limits, handles business logic (order math, inventory checks), and interacts with external services.

### 4. Data Layer
- **MongoDB**: Primary document store for users, orders, and products.
- **Cloudinary**: High-performance image distribution and transformations.
- **AI Integration**: Powers smart features like chatbots or personalized recommendations.
