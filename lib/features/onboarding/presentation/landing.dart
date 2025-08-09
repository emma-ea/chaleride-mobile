import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/features/auth/presentation/login.dart';
import 'package:chaleride/features/onboarding/presentation/splashscreen.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  Duration splashDuration = const Duration(seconds: 2);
  
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) { 
      Future.delayed(splashDuration, () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LoginView())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const PageMargin(showBottomNav: false, child: SplashScreen(),);
  }
}
