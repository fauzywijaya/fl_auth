// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_auth/src/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:fl_auth/src/core/presentations/presentations.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(this._localAuthentication) : super(SignInState()) {
    hasBiometric();
  }
  final LocalAuthentication _localAuthentication;

  Future<void> authenticate(String reason) async {
    try {
      state = state.copyWith(status: const AsyncLoading());

      final isAuthorized = await _localAuthentication.authenticate(
        localizedReason: reason,
        options:
            const AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );

      if (isAuthorized) {
        state = state.copyWith(status: const AsyncData(SignInStatus.granted));
      } else {
        state = state.copyWith(status: const AsyncData(SignInStatus.denied));
      }
    } on PlatformException {
      state = state.copyWith(status: const AsyncData(SignInStatus.denied));
    } on MissingPluginException {
      state = state.copyWith(status: const AsyncData(SignInStatus.denied));
    } catch (e) {
      state = state.copyWith(status: const AsyncData(SignInStatus.denied));
    }
  }

  Future<void> hasBiometric() async {
    final canAuthBiometric = await _localAuthentication.canCheckBiometrics;
    final isDeviceSupported = await _localAuthentication.isDeviceSupported();
    state = state.copyWith(hasBiometric: canAuthBiometric || isDeviceSupported);
  }

  Future<void> getBiometricType() async {
    final biometricType = await _localAuthentication.getAvailableBiometrics();

    biometricType.where((element) {
      if (element == BiometricType.face) {
        return true;
      } else if (element == BiometricType.fingerprint) {
        return true;
      }
      return false;
    });
    state = state.copyWith(listBiometric: biometricType);
  }
}

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  final localAuth = ref.watch(localAuthProvider);
  return SignInController(localAuth);
});
