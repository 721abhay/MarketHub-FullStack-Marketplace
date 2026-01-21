# Data Flow Diagram

```mermaid
sequenceDiagram
    participant U as User (App)
    participant P as UserProvider
    participant S as AuthService/ProductService
    participant A as Backend API
    participant D as MongoDB

    U->>S: Sign In Request
    S->>A: POST /api/signin
    A->>D: Find User
    D-->>A: User Data
    A-->>S: JWT + User JSON
    S->>P: Set User (State Update)
    P-->>U: Rebuild UI (Logged In)

    U->>S: Add Product to Cart
    S->>A: POST /api/add-to-cart
    A->>D: Update User Document
    D-->>A: Updated User
    A-->>S: Success Response
    S->>P: Update Cart State
    P-->>U: Refresh Cart Badge
```

## Data Movement Principles

### 1. Unidirectional Data Flow
UI triggers actions -> Services handle networking -> State (Provider) updates -> UI re-renders based on the new state.

### 2. State Syncing
Local state (UserProvider) is kept in sync with the remote Database through API responses. This ensures consistent data even after complex mutations like cart additions.

### 3. Persistent Auth
The JWT token is cached in local storage and injected into headers by services for all authenticated requests.
