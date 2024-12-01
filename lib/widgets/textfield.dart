import 'package:fingerprint/widgets/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final TextInputType ktype;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.width,
    this.ktype = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: ktype,
      decoration: InputDecoration(
        
        labelText: "Employee ID",
        labelStyle: TextStylesClass.normalStyle(
          size: width * 0.045,
        ),
      ),
    );
  }
}
