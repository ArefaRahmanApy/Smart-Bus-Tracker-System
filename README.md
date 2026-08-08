# Smart-Bus-Tracker-System

A full-stack bus tracking application with a Flutter frontend and a Dart backend.

## Architecture
- **Frontend**: Flutter (State management: Provider, Auth: Firebase)
- **Backend**: Dart (Framework: Shelf, Database: MongoDB)
- **Database**: MongoDB

## Setup Instructions

### 1. Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and in your PATH.
- [Dart SDK](https://dart.dev/get-dart) installed (usually included with Flutter).
- [MongoDB](https://www.mongodb.com/try/download/community) installed and running.
- A [Firebase Project](https://console.firebase.google.com/) created.

### 2. Backend Setup (`backend`)
1. Navigate to `backend`.
2. Run `dart pub get`.
3. Update `lib/database_service.dart` with your MongoDB connection string if different from `mongodb://localhost:27017/bus_tracking`.
4. Run the server: `dart bin/server.dart`.

### 3. Frontend Setup (`mobile`)
1. Navigate to `mobile`.
2. Run `flutter pub get`.
3. **Firebase Configuration**:
   - Add your Android app to the Firebase console.
   - Download `google-services.json` and place it in `mobile/android/app/`.
   - Uncomment `await Firebase.initializeApp();` in `lib/main.dart`.
4. **Google Maps**:
   - Get a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/).
   - Add the API key to your `AndroidManifest.xml`.
5. Run the app: `flutter run`.

## API Endpoints
- `GET /buses`: Fetches all current bus locations.
- `POST /update-location`: Updates the location of a specific bus.
  - Body: `{"busId": "123", "latitude": 0.0, "longitude": 0.0}`
