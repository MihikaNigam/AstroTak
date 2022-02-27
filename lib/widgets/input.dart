import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final validationfunc;
  final String? hint;
  final bool readOnly;
  final bool secure;
  final int maxLine;
  final String errorMessage;
  final String? label;
  final Color? cursorColor;
  final Color? hintColor;
  final Color? textColor;
  final InputBorder? inputborder;
  final TextInputType? keyboardtype;
  const Input({
    Key? key,
    required this.controller,
    this.validationfunc,
    this.keyboardtype = TextInputType.text,
    this.readOnly = false,
    this.secure = false,
    this.hint,
    this.maxLine = 1,
    this.label,
    this.errorMessage = "Field cannot be empty",
    this.cursorColor = black,
    this.hintColor = grey,
    this.textColor = black,
    this.inputborder = InputBorder.none,
    this.maxLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardtype,
      maxLines: maxLine,
      readOnly: readOnly,
      obscureText: secure,
      validator: validationfunc,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        border: inputborder,
        hintText: hint,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelStyle: TextStyle(
          color: hintColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        labelText: label,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: red, width: 2)),
        errorStyle: const TextStyle(
          color: red,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.start,
      style: TextStyle(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
