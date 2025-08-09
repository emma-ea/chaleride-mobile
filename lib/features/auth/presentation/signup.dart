import 'package:chaleride/core/platform/app_images.dart';
import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/core/presentation/widget/app_button.dart';
import 'package:chaleride/core/presentation/widget/app_flat_button.dart';
import 'package:chaleride/core/presentation/widget/app_input_field.dart';
import 'package:chaleride/core/presentation/widget/app_widget_divider.dart';
import 'package:chaleride/features/app_tabs/presentation/app_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  bool showingPassword = false;

  late TextEditingController emailController, phoneController, passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

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
              children: [
                AppFlatButton(
                  label: 'Skip',
                  action: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => const AppTabs()));
                  },
                )
              ],
            ),
            SizedBox(height: 2.h),
            SvgPicture.asset(AppImages.appLogo),
            SizedBox(height: 1.h),
            const Text('Join Chaleride',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat')),
            const SizedBox(height: 10),
            const Flexible(
              child: Text('Welcome, create an account and let\'s get you started',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            ),
            SizedBox(height: 2.h),
            AppInputField(
              onChanged: (value) {},
              hintText: 'Email',
              editController: emailController,
            ),
            SizedBox(height: 1.h,),
            AppInputField(
              onChanged: (value) {},
              hintText: 'Phone',
              editController: phoneController,
            ),
            SizedBox(height: 1.h),
            AppInputField(
              onChanged: (value) {print(value);},
              prefixWidget: GestureDetector(
                onTap: () { setState(() { showingPassword = !showingPassword; }); },
                child: showingPassword ? const Text('Hide') : const Text('Show')
              ),
              hintText: 'Password',
              hideText: !showingPassword,
              editController: passwordController,
            ),
            SizedBox(height: 2.h),
            AppButton(label: 'Sign up', action: () {}),
            SizedBox(height: 0.5.h),
            AppFlatButton(label: 'Already have an account?', action: () { Navigator.pop(context); },),
            SizedBox(height: 0.5.h),
            const AppWidgetDivider(label: 'or'),
            SizedBox(height: 2.h),
            AppButton(label: 'Sign up with Apple', icon: Icons.apple, action: () {}),
            SizedBox(height: 1.h),
            AppButton(label: 'Sign up with Google', userIcon: AppImages.googleIconSvg, action: () {}),
          ],
        ),
      ),
    );
  }
}
