import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  final String btnText;
  final Color btnColor;

  const CustomButton({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: width * 0.15,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: TextWidget(
          size: width * 0.07,
          color: ColorsClass.buttonTextColor,
          data: btnText,
        ),
      ),
    );
  }
}
