import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  const TextWidget({
    super.key,
    required this.size,
    required this.color,
    required this.data,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "Sumana"
      ),
    );
  }
}
