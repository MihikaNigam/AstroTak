import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final String label;
  final Widget? widget;
  const DefaultContainer({Key? key, this.label = "", this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: grey),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1.5),
                    borderRadius: BorderRadius.circular(5)),
                child: widget,
              ),
            )
          ],
        )
      ],
    );
  }
}
