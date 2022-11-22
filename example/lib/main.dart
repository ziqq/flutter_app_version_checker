import 'package:flutter/material.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _beautyBoxChecker = AppVersionChecker(
    appId: "ru.beautybox.twa",
    androidStore: AndroidStore.apkPure,
  );
  final _tikTokChecker = AppVersionChecker(
    appId: "com.zhiliaoapp.musically",
    androidStore: AndroidStore.apkPure,
  );
  String? tikTokValue;
  String? beautyboxValue;

  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  void checkVersion() async {
    await Future.wait([
      _tikTokChecker
          .checkUpdate()
          .then((value) => tikTokValue = value.toString()),
      _beautyBoxChecker
          .checkUpdate()
          .then((value) => beautyboxValue = value.toString()),
    ]);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('APP Version Checker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const SizedBox(height: 25.0),
              const Text(
                "TikTok: (apkPure)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                tikTokValue ?? 'Loading ...',
              ),
              const SizedBox(height: 50.0),
              const Text(
                "beauty box (apkPure):",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                beautyboxValue ?? "loading ...",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
