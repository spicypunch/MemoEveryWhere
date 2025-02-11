import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/features/auth/domain/repository/auth_repository.dart';

import '../../domain/state/auth_state.dart';

final authProvider =
AsyncNotifierProvider<AuthProvider, AuthState>(() => AuthProvider());

class AuthProvider extends AsyncNotifier<AuthState> {
  late final AuthRepository _authRepository;

  @override
  Future<AuthState> build() async {
    _authRepository = ref.watch(repositoryProvider);
    return const AuthState.unauthenticated();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signIn(email, password);
        return AuthState.authenticated();
      } catch (e) {
        return AuthState.error(e.toString());
      }
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signup(email, password);
        return AuthState.authenticated();
      } catch (e) {
        return AuthState.error(e.toString());
      }
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authRepository.signOut();
        return const AuthState.unauthenticated();
      } catch (e) {
        return AuthState.error(e.toString());
      }
    });
  }
}