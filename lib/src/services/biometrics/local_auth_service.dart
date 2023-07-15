import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final localAuthProvider = Provider<LocalAuthentication>((ref) {
  return LocalAuthentication();
});

// final hasBiometricProvider = FutureProvider.autoDispose<bool>((ref) async {
//   final localAuth = ref.watch(localAuthProvider);

//   final canAuthBiometric = await localAuth.canCheckBiometrics;
//   final isDeviceSupported = await localAuth.isDeviceSupported();

//   return canAuthBiometric || isDeviceSupported;
// });

// final biometricTypeProvider = FutureProvider.autoDispose<List<BiometricType>>(
//   (ref) {
//     final localAuth = ref.watch(localAuthProvider);
//     final biometricType = localAuth.getAvailableBiometrics();
//     return biometricType;
//   },
// );
