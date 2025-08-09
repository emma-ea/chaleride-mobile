import 'package:chaleride/core/platform/app_colors.dart';
import 'package:chaleride/core/platform/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SvgPicture.asset(AppImages.appLogo),
      ),
    );
  }
}
