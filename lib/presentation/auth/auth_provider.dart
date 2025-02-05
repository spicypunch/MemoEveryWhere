import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/data/provider/supabase_provicer.dart';
import 'package:memo_everywhere/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

final authProvider =
    AsyncNotifierProvider<AuthProvider, AuthState>(() => AuthProvider());

class AuthProvider extends AsyncNotifier<AuthState> {
  late final Repository _repository;

  @override
  Future<AuthState> build() async {
    _repository = ref.watch(repositoryProvider);
    return const AuthInitial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _repository.signIn(email, password);
        return const AuthSuccess();
      } catch (e) {
        return AuthError(e.toString());
      }
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _repository.signup(email, password);
        return const AuthSuccess();
      } on AuthException catch (e) {
        // if (e.message.contains('User ale'))
        return AuthError(e.toString());
      } catch (e) {
        return AuthError(e.toString());
      }
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _repository.signOut();
        return const AuthInitial();
      } catch (e) {
        return AuthError(e.toString());
      }
    });
  }
}
