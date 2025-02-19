# OffiQL  

OffiQL is a Flutter application that fetches and displays user data from an API using Provider state management. It includes structured models, API services, and UI components to manage and display user information effectively.  

## Features  
- Fetch users from a remote API (JSONPlaceholder)  
- Display user details using Provider for state management  
- Implement structured models (`User`, `Address`, `Company`, `Geo`)  
- Handle API errors with proper exception handling  
- Implement a search widget for filtering users  

## Dependencies  
This project uses the following dependencies:  
- `flutter` (Framework for building the app)  
- `provider` (State management)  
- `http` (API calls and fetching data)  

Make sure to include these in your `pubspec.yaml` file:  

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.3.0
  provider: ^6.1.2
