# NasaAPI Frontend (Flutter)

This is a Flutter application that serves as the frontend for the NasaAPI project. It displays NASA API events in a calendar view.

## Technologies Used

*   Flutter
*   Dart

## Prerequisites

Before running this project, ensure you have:

*   **Flutter SDK installed:** Follow the official Flutter installation guide: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   **A running backend server:** This frontend communicates with a backend API. Make sure the `backend` project is running, typically on `http://localhost:8080`. Refer to the `backend/README.md` for instructions on how to run the backend.

## How to Run the Project

1.  **Navigate to the frontend project directory:**

    ```bash
    cd frontend/calendar
    ```

2.  **Get Flutter dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the application:**

    You can run the application on various platforms:

    *   **Web:**
        ```bash
        flutter run -d chrome
        ```
        This will open the application in your Chrome browser.

    *   **Android (requires Android Studio and an Android emulator/device setup):**
        ```bash
        flutter run
        ```
        If you have multiple devices connected, you might need to specify one: `flutter run -d <device_id>` (use `flutter devices` to list available devices).

    *   **iOS (requires Xcode and an iOS simulator/device setup on macOS):**
        ```bash
        flutter run
        ```
        Similar to Android, you might need to specify a device: `flutter run -d <device_id>`.

## Important Notes

*   The application fetches data from `http://localhost:8080/user?ano=2025`. Ensure your backend is accessible at this address.
*   The `main.dart` file contains the `_responseHttp()` function which makes the API call to the backend. You might need to adjust the URL if your backend is running on a different host or port.