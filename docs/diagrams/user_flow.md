# User Flow Diagram

```mermaid
stateDiagram-v2
    [*] --> SplashScreen
    SplashScreen --> AuthScreen: No Token
    SplashScreen --> HomeScreen: Token Found
    
    AuthScreen --> Login: Select Login
    AuthScreen --> Register: Select Register
    Login --> HomeScreen: Success
    Register --> HomeScreen: Success

    HomeScreen --> Search: Search Input
    HomeScreen --> CategoryView: Click Category
    HomeScreen --> ProductDetail: Click Product

    Search --> ProductDetail: Select Product
    CategoryView --> ProductDetail: Select Product

    ProductDetail --> Cart: Add to Cart
    HomeScreen --> Cart: Bottom Nav
    
    Cart --> AddressForm: Proceed to Buy
    AddressForm --> Payment: Pay Now
    Payment --> OrderSuccess: Confirmed
    OrderSuccess --> HomeScreen

    HomeScreen --> AccountProfile: Bottom Nav
    AccountProfile --> MyOrders
    MyOrders --> OrderDetail
```

## Primary Flows

### 1. Purchase Funnel
The path from discovering a product via Search/Categories to completing a checkout. Includes state persistence for the shopping cart.

### 2. Authentication Lifecycle
Ensures secure access. Uses JWT tokens stored locally on the device to bypass logins on subsequent app launches.

### 3. Order Management
Allows users to track their purchase history and view specific delivery statuses (Pending -> Delivered).
