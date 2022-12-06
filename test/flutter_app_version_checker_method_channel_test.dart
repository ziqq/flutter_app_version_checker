import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker_method_channel.dart';

void main() {
  final MethodChannelAppVersionChecker platform =
      MethodChannelAppVersionChecker();
  const MethodChannel channel = MethodChannel('flutter_app_version_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
