import 'package:chaleride/core/platform/app_images.dart';
import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/core/presentation/widget/app_button.dart';
import 'package:chaleride/core/presentation/widget/app_flat_button.dart';
import 'package:chaleride/core/presentation/widget/app_input_field.dart';
import 'package:chaleride/core/presentation/widget/app_widget_divider.dart';
import 'package:chaleride/features/app_tabs/presentation/app_tabs.dart';
import 'package:chaleride/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return PageMargin(
      showBottomNav: false,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AppFlatButton(label: 'Skip', action: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const AppTabs()));},)],
            ),
            SizedBox(height: 4.h),
            SvgPicture.asset(AppImages.appLogo),
            SizedBox(height: 1.h),
            Text('Welcome back', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
            const SizedBox(height: 10),
            Text('Let\'s get you started', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            SizedBox(height: 5.h),
            AppInputField(
              onChanged: (value) {},
              hintText: 'Email',
            ),
            SizedBox(height: 1.h),
            AppInputField(
              onChanged: (value) {},
              hintText: 'Password',
            ),
            SizedBox(height: 2.h),
            AppFlatButton(label: 'Forgotten Password ?', action: () {},),
            SizedBox(height: 2.h),
            AppButton(label: 'Login', action: () {}),
            SizedBox(height: 2.h),
            const AppWidgetDivider(label: 'or'),
            SizedBox(height: 2.h),
            AppButton(label: 'Sign in with Apple', icon: Icons.apple, action: () {}),
            SizedBox(height: 1.h),
            AppButton(label: 'Sign in with Google', action: () {}),
            SizedBox(height: 2.h),
            AppFlatButton(label: 'Don\'t have an account ?', action: () {},)
          ],
        ),
      ),
    );
  }
}
