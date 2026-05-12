# Firebase setup

This project already contains Firebase app configuration for Android and iOS:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `lib/firebase_options.dart`

This branch adds:

- Firebase Analytics
- Firebase Crashlytics
- Firebase Realtime Database

## Firebase console checklist

1. Open https://console.firebase.google.com/
2. Select the existing `shopper-c2bc6` Firebase project.
3. Open Project settings and confirm these apps exist:
   - Android package: `com.example.shopper`
   - iOS bundle ID: `com.example.shopper`
4. Open Build > Realtime Database.
5. Create a Realtime Database instance if one does not exist.
6. Use test mode only while developing. Before production, replace test rules with locked-down app rules.
7. Open Run > Crashlytics.
8. Follow the Crashlytics onboarding prompt, then run the app once.
9. To verify Crashlytics, temporarily trigger a test crash from app code, reopen the app, and wait a few minutes for the report.

## Local verification

```sh
flutter pub get
flutter analyze
flutter test
cd ios && pod install
```

If Flutter is not installed globally on this Mac, use the workspace Flutter SDK:

```sh
/Users/abc_1/Documents/New\ project/.flutter_sdk/bin/flutter pub get
```
