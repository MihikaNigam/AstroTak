import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';

class QuestionTextBox extends StatelessWidget {
  final TextEditingController tc;
  const QuestionTextBox({Key? key, required this.tc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: black.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextField(
        controller: tc,
        maxLength: 150,
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintStyle: TextStyle(
              letterSpacing: 1, fontSize: 16, color: black.withOpacity(0.5)),
          hintText: 'Type your question here',
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
