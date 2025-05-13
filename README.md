# Memo Everywhere

Memo Everywhere is a note-taking app available on Android, iOS, and Web. It uses Firebase to store your data so you can access your notes anywhere.

Whether you're on a Windows PC at home, a Mac at the office, or using your mobile device or computer on the go, you can create and view your notes seamlessly.

Easily check your personal API keys, Git tokens, account information, and more across different platforms.

[👉 Web](https://memoeverywhere-b3cfb.web.app/)  
[👉 Android](https://github.com/spicypunch/MemoEveryWhere/releases/tag/v1.0.0)

[👉iOS] The cost of an Apple developer account is just too high...

---

## Sign In / Sign Up

<img src="https://github.com/user-attachments/assets/e75cd2b0-848c-4eb1-9295-019b3039d93c" width="200">  
<img src="https://github.com/user-attachments/assets/8ab1784f-433c-4237-8ac2-71f1c77eb59e" width="200">

---

## Home Screen

### Mobile
<img src="https://github.com/user-attachments/assets/f90ac44c-0b41-4014-9a5f-3fa29af33081" width="200">

### Web
<img src="https://github.com/user-attachments/assets/3c0faa6d-54ee-48fa-a23e-38c0514fbe90" width="800">

---

## Create Note

<img src="https://github.com/user-attachments/assets/d91454ac-7bfa-41a4-aeb3-cb271daee022" width="200">

---

## Detail View / Edit / Delete Note

### Mobile
<img src="https://github.com/user-attachments/assets/14a7745c-dd34-4a1f-bde8-252e2e7f428a" width="200">  
<img src="https://github.com/user-attachments/assets/d0df600a-de3c-4239-a1ac-33599ae48db8" width="200">  
<img src="https://github.com/user-attachments/assets/0cf3cf2b-1492-44d5-9047-44bca0c70761" width="200">

### Web
<img src="https://github.com/user-attachments/assets/62a3bdff-4a2d-4c8a-9e96-ff60da022926" width="800">
<img src="https://github.com/user-attachments/assets/97b2f58d-f76e-4c54-8ebb-77759495b6c3" width="800">
<img src="https://github.com/user-attachments/assets/86648410-2ef5-4cf2-946f-2651d1c3e6bb" width="800">

---

## HyperLink

### Mobile
<img src="https://github.com/user-attachments/assets/cc3d8c58-6b46-4ece-a22c-ba93bf203b2d" width="200">

### Web
<img src="https://github.com/user-attachments/assets/f9c8bc22-4718-406c-aeb7-512d00f57712" width="200">

---

## Key Features

- Cross-platform note-taking
- Cloud storage and synchronization via Firebase
- Create, edit, and delete notes from anywhere

---

## Technology Stack

- **Framework**: Flutter (SDK ^3.6.0)
- **State Management**: Riverpod
- **Routing**: Go Router
- **Backend**: Firebase (Authentication, Cloud Firestore)
- **Data Modeling**: Freezed, JSON Serialization

---

## Project Structure

```
memo_everywhere/
│
├── core/
│   ├── colors/
│   │   └── default_colors.dart
│   ├── components/
│   │   ├── default_button.dart
│   │   ├── default_layout.dart
│   │   ├── default_text_field.dart
│   │   └── default_text_form_field.dart
│   ├── config/
│   │   ├── firebase_config.dart
│   ├── go_router/
│   │   └── go_router.dart
│   ├── log/
│   │   └── provider_observer.dart
│   ├── models/
│   │   ├── memo.dart
│   │   ├── memo.freezed.dart
│   │   └── memo.g.dart
│   ├── provider/
│   │   └── firebase_provider.dart
│   └── utils/
│       └── contextExtensions.dart
│
├── features/
│   ├── add/
│   │   ├── data/
│   │   │   └── repository/
│   │   │       └── add_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repository/
│   │   │   │   └── add_repository.dart
│   │   │   └── state/
│   │   │       ├── add_state.dart
│   │   │       ├── add_state.freezed.dart
│   │   │       └── add_state.g.dart
│   │   └── presentation/
│   │       ├── add_provider.dart
│   │       └── add_screen.dart
│   │
│   ├── auth/
│   │   ├── data/
│   │   │   └── repository/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repository/
│   │   │   │   └── auth_repository.dart
│   │   │   └── state/
│   │   │       ├── auth_state.dart
│   │   │       ├── auth_state.freezed.dart
│   │   │       └── auth_state.g.dart
│   │   └── presentation/
│   │       ├── auth_provider.dart
│   │       ├── signin_screen.dart
│   │       └── signup_screen.dart
│   │
│   ├── detail/
│   │   ├── data/
│   │   │   └── repository/
│   │   │       └── detail_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repository/
│   │   │   │   └── detail_repository.dart
│   │   │   └── state/
│   │   │       ├── detail_state.dart
│   │   │       ├── detail_state.freezed.dart
│   │   │       └── detail_state.g.dart
│   │   └── presentation/
│   │       ├── detail_provider.dart
│   │       ├── detail_desktop_screen.dart
│   │       └── detail_mobile_screen.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   │   └── repository/
│   │   │       └── home_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repository/
│   │   │   │   └── home_repository.dart
│   │   │   └── state/
│   │   │       ├── home_state.dart
│   │   │       ├── home_state.freezed.dart
│   │   │       └── home_state.g.dart
│   │   └── presentation/
│   │       ├── home_provider.dart
│   │       └── home_screen.dart
│   │
│   └── splash/
│       └── presentation/
│           └── splash_screen.dart
│
├── firebase_options.dart
└── main.dart
```

## Packages Used

- **UI & Routing**:
  - `flutter`: Cross-platform UI framework
  - `go_router`: Routing management

- **State Management**:
  - `hooks_riverpod`: Integration of Riverpod state management with hooks

- **Data Handling**:
  - `json_annotation`: JSON serialization support
  - `freezed_annotation`: Immutable data class generation

- **Backend Integration**:
  - `firebase_auth`: User authentication
  - `cloud_firestore`: Cloud database

- **Development Tools**:
  - `AndroidStudio`: meerkat version

---

## Future Development Plans

- macOS support (currently addressing build errors)
- Note sharing functionality
- Theme customization

---

## License

This project is distributed under the MIT License.
