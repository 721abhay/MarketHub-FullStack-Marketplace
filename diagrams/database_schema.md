# Database Schema Diagram

![Database Schema Visual](./assets/database_schema.png)

```mermaid
erDiagram
    USER ||--o{ ORDER : "places"
    USER ||--o{ PRODUCT : "sells"
    USER {
        string name
        string email
        string password
        string address
        string type "user/seller/admin"
        number wallet
        object cart "Array of product refs"
    }
    
    PRODUCT ||--o{ ORDER : "included in"
    PRODUCT {
        string name
        string description
        string[] images
        number quantity
        number price
        string category
        object[] ratings
        objectId sellerId
    }

    ORDER {
        object[] products "Embedded product schemas"
        number totalPrice
        string address
        string userId
        number orderedAt
        number status "0:Pending to 4:Cancelled"
    }

    BLOG_POST ||--o{ USER : "authored by"
    IOT_DEVICE ||--o{ USER : "owned by"
    COURSE ||--o{ USER : "created by"
    JOB ||--o{ USER : "posted by"

    USER ||--o{ NOTIFICATION : "receives"
```

## Entity Details

### User Entity
Central entity managing identity, roles (User, Seller, Admin), and the shopping experience (Cart, Wishlist, Wallet).

### Product Entity
Managed by Sellers. Contains inventory details, pricing, and nested ratings for performance.

### Order Entity
Captures a snapshot of products at the time of purchase. Tracks shipping status and delivery address.

### Specialized Entities
- **IoT Device**: For smart home integration tracking.
- **Job/Course/Property**: For the specialized marketplace modules.
- **Consultation/Event**: For service-based offerings.
