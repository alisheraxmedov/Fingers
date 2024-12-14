import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String labelText;
  final VoidCallback? onTap;
  final bool readOnly;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.width,
    required this.labelText,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: "Sumana",
          ),
          border: const OutlineInputBorder(),
        ),
        onTap: onTap,
        readOnly: readOnly,
      ),
    );
  }
}
