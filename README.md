# Memo Everywhere

Memo Everywhere는 안드로이드, iOS 플랫폼에서 동작하는 메모 앱으로, Firebase를 통해 데이터를 저장하여 어디서나 접근할 수 있습니다.

집의 윈도우와 사무실의 mac, 모바일과 PC 어디든 메모를 하고 메모한 내용을 볼 수 있는 앱이 필요해 제작하였습니다.

개인적인 API Key, 깃 토큰, 계정 정보 등의 내용들을 여러 플랫폼에서 확인해 보세요.

## 주요 기능

- 크로스 플랫폼 메모 앱
- Firebase를 통한 클라우드 저장 및 동기화
- 어디서든 메모 접근 가능

## 기술 스택

- **프레임워크**: Flutter (SDK ^3.6.0)
- **상태 관리**: Hooks Riverpod, Flutter Hooks
- **라우팅**: Go Router
- **백엔드**: Firebase (Authentication, Cloud Firestore)
- **데이터 모델링**: Freezed, JSON Serialization


## 프로젝트 구조

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
│   │       └── detail_screen.dart
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

## 사용된 패키지

- **UI 및 라우팅**:
  - `flutter`: 크로스 플랫폼 UI 프레임워크
  - `go_router`: 라우팅 관리

- **상태 관리**:
  - `flutter_hooks`: React hooks 스타일의 상태 관리
  - `hooks_riverpod`: Riverpod 상태 관리와 hooks 통합

- **데이터 처리**:
  - `json_annotation`: JSON 직렬화 지원
  - `freezed_annotation`: 불변 데이터 클래스 생성
  - `intl`: 국제화 및 날짜 포맷팅

- **백엔드 통합**:
  - `firebase_core`: Firebase 핵심 기능
  - `firebase_auth`: 사용자 인증
  - `cloud_firestore`: 클라우드 데이터베이스

- **개발 도구**:
  - `json_serializable`: JSON 직렬화 코드 생성
  - `build_runner`: 코드 생성 자동화
  - `freezed`: 불변 데이터 클래스 생성기

## 향후 개발 계획

- Windows 및 macOS 데스크톱 지원 추가
- 오프라인 모드 구현
- 메모 공유 기능
- 마크다운 지원
- 테마 커스터마이징

## 라이센스

이 프로젝트는 MIT 라이센스 하에 배포됩니다.

## 연락처

개발자: [이름]  
이메일: [이메일 주소]  
GitHub: [GitHub 프로필 링크]
