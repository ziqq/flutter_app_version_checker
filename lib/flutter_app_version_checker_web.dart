// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.

import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_app_version_checker_platform_interface.dart';

/// A web implementation of the FlutterAppVersionCheckerPlatform of the AppVersionCheckerPlugin plugin.
class AppVersionCheckerPlugin extends AppVersionCheckerPlatform {
  /// Constructs a FlutterAppVersionCheckerWeb
  AppVersionCheckerPlugin();

  static void registerWith(Registrar registrar) {
    AppVersionCheckerPlatform.instance = AppVersionCheckerPlugin();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
