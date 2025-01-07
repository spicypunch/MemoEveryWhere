import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] $message');
  }

  bool shouldLog(ProviderBase<Object?> provider) {
    return true;
  }

  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    if (shouldLog(provider)) {
      log('Updated Provider: ${provider.runtimeType}, Previous Value: $previousValue, New Value: $newValue');
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(
      ProviderBase<Object?> provider,
      Object? value,
      ProviderContainer container,
      ) {
    if (shouldLog(provider)) {
      log('Added Provider: ${provider.runtimeType}, Initial Value: $value');
    }
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider,
      ProviderContainer container,
      ) {
    if (shouldLog(provider)) {
      log('Disposed Provider: ${provider.runtimeType}');
    }
    super.didDisposeProvider(provider, container);
  }
}
