import 'package:flutter/material.dart';

void showSnackBar(String? message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message!),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
