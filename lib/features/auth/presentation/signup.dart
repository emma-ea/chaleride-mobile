import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return PageMargin(child: Column(
      children: [
        Text('Sign up')
      ],
    ), showBottomNav: false,);
  }
}