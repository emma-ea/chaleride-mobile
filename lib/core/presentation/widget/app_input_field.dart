import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  AppInputField({super.key, TextEditingController? editController, required this.onChanged, this.hintText = '', this.radiusSize, this.prefixWidget, this.hideText = false}) {
    if (editController != null) {
       _textController = editController;
    }
  }

  final ValueChanged<String> onChanged;
  final String hintText;
  final double? radiusSize;
  final Widget? prefixWidget;
  final bool hideText;

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(radiusSize ?? 15))),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          suffix: prefixWidget,
        ),
        maxLines: 1,
        obscureText: hideText,
        controller: _textController,
        onChanged: onChanged,
      ),
    );
  }
}
