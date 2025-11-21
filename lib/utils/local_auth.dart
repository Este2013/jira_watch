// ignore: depend_on_referenced_packages
import 'package:local_auth/local_auth.dart';
import 'package:loggy/loggy.dart';

class LocalAuthManager with UiLoggy {
  final auth = LocalAuthentication();

  Future<bool> authenticate() async {
    final bool canCheck = await auth.canCheckBiometrics || await auth.isDeviceSupported();

    if (!canCheck) {
      loggy.error('This device does not support authentication');
      throw Exception('This device does not support authentication');
    }

    try {
      final bool didAuth = await auth.authenticate(
        localizedReason: 'Please authenticate to be able to view your API key',
        biometricOnly: false,
      );

      return didAuth;
    } catch (e) {
      rethrow;
    }
  }
}
