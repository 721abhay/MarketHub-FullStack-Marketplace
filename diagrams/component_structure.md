# Component Structure Diagram

```mermaid
graph TD
    App[MaterialApp] --> Router[AppRouter]
    Router --> Screens[Feature Screens]
    
    subgraph Common_Widgets [Reusable Components]
        CW1[CustomButton]
        CW2[CustomTextField]
        CW3[StarsRating]
        CW4[BottomBar]
        CW5[Loader]
    end

    subgraph Home_Feature [Home Screen]
        H1[AddressBox]
        H2[TopCategories]
        H3[CarouselImage]
        H4[DealOfDay]
    end

    subgraph Auth_Feature [Auth Screen]
        A1[LoginToggle]
        A2[RegisterForm]
    end

    subgraph Cart_Feature [Cart Screen]
        C1[CartSubtotal]
        C2[CartProduct]
    end

    Screens --> Home_Feature
    Screens --> Auth_Feature
    Screens --> Cart_Feature
    
    Home_Feature --> CW1
    Home_Feature --> CW2
    Auth_Feature --> CW1
```

## Frontend Architecture

### Atomic Design Principles
- **Common Widgets**: Foundational pieces used across all features (buttons, inputs).
- **Feature Modules**: Encapsulated UI logic for specific domains (Home, Account, Cart).
- **Providers**: Global state management (User information, localization).

### Routing
Uses the `onGenerateRoute` pattern for dynamic navigation and passing arguments between screens.
