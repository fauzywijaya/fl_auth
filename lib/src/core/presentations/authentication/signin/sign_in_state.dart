// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

enum SignInStatus {
  none,
  loading,
  granted,
  denied,
}

class SignInState {
  final AsyncValue<SignInStatus> status;
  final bool hasBiometric;
  final List<BiometricType> listBiometric;

  SignInState({
    this.status = const AsyncData(SignInStatus.none),
    this.hasBiometric = false,
    this.listBiometric = const <BiometricType>[],
  });

  SignInState copyWith({
    AsyncValue<SignInStatus>? status,
    bool? hasBiometric,
    List<BiometricType>? listBiometric,
  }) {
    return SignInState(
      status: status ?? this.status,
      hasBiometric: hasBiometric ?? this.hasBiometric,
      listBiometric: listBiometric ?? this.listBiometric,
    );
  }
}
