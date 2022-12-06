import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_app_version_checker_method_channel.dart';

abstract class AppVersionCheckerPlatform extends PlatformInterface {
  /// Constructs a FlutterAppVersionCheckerPlatform.
  AppVersionCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppVersionCheckerPlatform _instance = MethodChannelAppVersionChecker();

  /// The default instance of [FlutterAppVersionCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppVersionChecker].
  static AppVersionCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppVersionCheckerPlatform] when
  /// they register themselves.
  static set instance(AppVersionCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
