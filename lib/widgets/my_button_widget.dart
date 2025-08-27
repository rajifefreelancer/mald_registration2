import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double? uiHeight;
  final double? uiWidth;
  final double borderRadius;
  final Function()? onPressed;
  final Widget? buttonChild;
  const MyButton({
    super.key,
    this.uiHeight,
    this.uiWidth,
    required this.borderRadius,
    required this.onPressed,
    required this.buttonChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: uiHeight,
      width: uiWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff5a81fa),
          minimumSize: Size(uiWidth ?? 50, uiHeight ?? 40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: buttonChild,
      ),
    );
  }
}
