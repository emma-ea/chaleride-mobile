import 'package:flutter/material.dart';

class AppWidgetDivider extends StatelessWidget {
  const AppWidgetDivider({super.key, required this.label, this.dividerColor, this.labelColor});

  final String label;
  final Color? dividerColor, labelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: dividerColor ?? Colors.black)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(label, style: TextStyle(color: labelColor)),
        ),
        Expanded(child: Divider(color: dividerColor ?? Colors.black))
      ],
    );
  }
}