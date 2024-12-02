import 'package:fingerprint/widgets/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String labelText;
  final TextInputType ktype;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.width,
    required this.labelText,
    this.ktype = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: ktype,
      decoration: InputDecoration(
        
        labelText: labelText,
        labelStyle: TextStylesClass.normalStyle(
          size: width * 0.045,
        ),
      ),
    );
  }
}
