import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/features/auth/domain/repository/auth_repository.dart';

import '../domain/state/auth_state.dart';

final authProvider =
AsyncNotifierProvider<AuthProvider, AuthState>(() => AuthProvider());

class AuthProvider extends AsyncNotifier<AuthState> {
  late final AuthRepository _authRepository;

  @override
  Future<AuthState> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser != null) {
      return AuthState(isSignedIn: true);
    }
    return const AuthState();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signIn(email, password);
        return AuthState(isSignedIn: true);
      } catch (e) {
        return AuthState(error: e.toString());
      }
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signup(email, password);
        return AuthState(isSignedUp: true);
      } catch (e) {
        return AuthState(error: e.toString());
      }
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signOut();
        return AuthState(isSignedOut: true);
      } catch (e) {
        return AuthState(error: e.toString());
      }
    });
  }
}