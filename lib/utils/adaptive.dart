// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adaptive extends StatelessWidget {
  final Widget Function() builder;

  const Adaptive({
    Key? key,
    required this.builder,
  })  : assert(builder != null),
        super(key: key);

  Size get designSize => const Size(375, 667);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: this.designSize,
      builder: this.builder,
    );
  }
}
