import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppVersionChecker _beautyBoxChecker;
  late AppVersionChecker _tikTokChecker;
  String? beautyboxValue;
  String? tikTokValue;

  @override
  void initState() {
    super.initState();
    _beautyBoxChecker = AppVersionChecker(
      appId: kIsWeb
          ? 'ru.beautybox.twa'
          : Platform.isAndroid
              ? 'ru.beautybox.twa'
              : 'ru.beautybox.app',
    );
    _tikTokChecker = AppVersionChecker(
      appId: 'com.zhiliaoapp.musically',
      androidStore: AndroidStore.apkPure,
    );

    checkVersion();
  }

  void checkVersion() async {
    Future.wait([
      _tikTokChecker
          .checkUpdate()
          .then((value) => tikTokValue = value.toString()),
      _beautyBoxChecker
          .checkUpdate()
          .then((value) => beautyboxValue = value.toString()),
    ]).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Version Checker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 25.0),
              const Text(
                "beauty box",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(beautyboxValue ?? "loading ..."),
              const SizedBox(height: 50.0),
              const Text(
                "TikTok: (apkPure)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(tikTokValue ?? 'Loading ...'),
            ],
          ),
        ),
      ),
    );
  }
}
