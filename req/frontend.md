# Stash Stash Frontend Development (Mobile - Flutter)

## Project Overview
Stash Stash is a platform designed to store and share personal content, inspired by Deepstash. The mobile version is built using **Flutter**, offering a consistent and responsive experience across both Android and iOS. The MVP will include user authentication, content creation, and social features, with a strong emphasis on usability and seamless navigation.

## Feature Requirements
We will use **Flutter**, **Supabase**, **Clerk**, and other tools as needed to ensure functionality and design consistency.

### Core Features:
1. **User Authentication**  
   - Sign-up and login flow using Clerk or FirebaseAuth.  
   - Profile management with editable user details.

2. **Content Creation & Management**  
   - Users can create, edit, and delete content (stashes).  
   - Support for rich-text editor or markdown input using Flutter plugins like `flutter_quill` or `zefyr`.

3. **Search & Filters**  
   - Search functionality for stashes using a text input search bar.  
   - Filters based on categories or tags with dropdowns or chips.

4. **Social Features**  
   - Users can like, bookmark, and share stashes.  
   - Collaboration features such as comments or shared stashes.

5. **Responsive UI**  
   - Adaptive layouts using `MediaQuery` for different screen sizes.  
   - Clean and minimal design leveraging Flutter widgets and themes.

## Relevant Documentation

### Flutter Documentation:
- [Flutter Documentation](https://docs.flutter.dev): Official guide for setting up, developing, and deploying Flutter apps.
- [Flutter DevTools](https://docs.flutter.dev/tools/devtools/overview): Debugging and performance optimization tools.

### Authentication & Backend:
- [Clerk Documentation](https://clerk.dev/docs): Integration for authentication services.
- [Supabase Documentation](https://supabase.com/docs): For real-time database, authentication, and storage needs.

### UI Components:
- [Flutter Quill](https://pub.dev/packages/flutter_quill): For implementing a rich-text editor.
- [Material Design Widgets](https://flutter.dev/docs/development/ui/widgets/material): Guidelines for material design in Flutter.

## Current File Structure

STASHSTASH/
├── .dart_tool/
├── .idea/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── req/
│   └── frontend.md
├── test/
├── web/
├── windows/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
├── README.md
└── stashstash.iml

# Rules

1. **Project Structure**  
   - The app should follow the **MVVM (Model-View-ViewModel)** architecture for clear separation of concerns and maintainability.
   - All new **UI components** should be placed in the `lib/ui/components` folder and named using the `example_component.dart` convention unless otherwise specified.
   - All **screens (pages)** should be placed in the `lib/ui/screens` folder and follow the naming convention `example_screen.dart`.

2. **Folder Organization**  
   - **Models** should be placed in the `lib/models` folder.  
   - **ViewModels** should be placed in the `lib/viewmodels` folder.  
   - **Services or Repositories** (if used) should be placed in the `lib/services` or `lib/repositories` folder.

3. **Component Reusability**  
   - Design all components to be reusable wherever possible.
   - Extract common widgets and place them in the `lib/ui/components` folder.

4. **State Management**  
   - Use **Provider** or **Riverpod** for state management and dependency injection.
   - Keep business logic in **ViewModels** to ensure the UI layer remains clean.

5. **Naming Conventions**  
   - Use snake_case for file and folder names (e.g., `example_component.dart`).  
   - Use PascalCase for class names and constants (e.g., `ExampleComponent`).

6. **Testing**  
   - Write unit tests for all **ViewModels** and critical business logic.  
   - Add widget tests for major UI components and screens.

7. **Coding Standards**  
   - Follow **Dart's official guidelines** for coding conventions and formatting.
   - Use `dart format` before committing code.

8. **Documentation**  
   - Add comments for public methods, classes, and complex logic.
   - Write a brief description for each new ViewModel and screen in the respective file.