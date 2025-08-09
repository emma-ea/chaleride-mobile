import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/core/presentation/widget/app_button.dart';
import 'package:chaleride/core/presentation/widget/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ForgottenPasswordView extends StatelessWidget {
  const ForgottenPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageMargin(
      showBottomNav: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
          ),
          const Text('Password Reset', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
          SizedBox(height: 3.h),
          const Text('Enter an email associated with your account, and we\'ll send you an OTP to reset your password'),
          SizedBox(height: 2.h),
          AppInputField(onChanged: (value) {}, hintText: 'Your email', radiusSize: 5,),
          SizedBox(height: 2.h),
          AppButton(label: 'Send OTP', radiusSize: 5, action: () {}),
        ],
      ),
    );
  }
}