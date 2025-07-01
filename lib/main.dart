import 'package:chaleride/core/platform/app_internet_status.dart';
import 'package:flutter/material.dart';

void main() {
  AppInternetStatus.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
