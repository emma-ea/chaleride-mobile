import 'package:chaleride/core/platform/app_internet_status.dart';
import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/features/onboarding/presentation/landing.dart';
import 'package:chaleride/features/onboarding/presentation/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInternetStatus.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          home: LandingView(),
        );
      }
    );
  }
}
