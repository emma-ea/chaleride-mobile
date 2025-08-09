import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.label, required this.action, this.icon, this.userIcon, this.radiusSize});

  final String label;
  final IconData? icon;
  final String? userIcon;
  final VoidCallback action;
  final double? radiusSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(radiusSize ?? 40))),
      child: TextButton(
        onPressed: action,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            userIcon != null ? SvgPicture.asset(userIcon!, width: 20, height: 20,) : icon != null ? Icon(icon, color: Colors.white,) : const SizedBox.shrink(),
            (icon != null || userIcon != null) ? const SizedBox(width: 10) : const SizedBox.shrink(),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
