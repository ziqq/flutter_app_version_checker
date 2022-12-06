import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'flutter_app_version_checker_platform_interface.dart';

/// An implementation of [FlutterAppVersionCheckerPlatform] that uses method channels.
class MethodChannelAppVersionChecker extends AppVersionCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_app_version_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
