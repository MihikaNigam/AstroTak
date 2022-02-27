import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final String text;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final Color buttonColor;
  final onPressed;
  final double buttonWidth;
  final double elevation;
  const CustomButton(
      {Key? key,
      required this.text,
      this.borderColor = primary,
      this.textColor = white,
      this.buttonColor = primary,
      this.fontSize = 12,
      this.onPressed,
      this.buttonHeight = 35,
      this.buttonWidth = 140,
      this.elevation = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: elevation,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: buttonHeight,
            width: buttonWidth,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: borderColor, width: 1)),
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize),
            ),
          ),
        ));
  }
}
