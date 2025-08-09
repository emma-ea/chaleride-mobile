import 'package:flutter/material.dart';

class AppFlatButton extends StatelessWidget {
  const AppFlatButton({super.key, required this.label, required this.action});

  final String label;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}
