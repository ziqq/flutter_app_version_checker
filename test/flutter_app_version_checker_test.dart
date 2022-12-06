// ignore_for_file: prefer_mixin, depend_on_referenced_packages, unused_local_variable, prefer_final_locals

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker_platform_interface.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppVersionCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AppVersionCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppVersionCheckerPlatform initialPlatform =
      AppVersionCheckerPlatform.instance;

  test('$MethodChannelAppVersionChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppVersionChecker>());
  });

  test('getPlatformVersion', () async {
    AppVersionChecker flutterAppVersionCheckerPlugin = AppVersionChecker();
    MockFlutterAppVersionCheckerPlatform fakePlatform =
        MockFlutterAppVersionCheckerPlatform();
    AppVersionCheckerPlatform.instance = fakePlatform;

    expect(await fakePlatform.getPlatformVersion(), '42');
  });
}
