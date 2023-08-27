import 'package:flutter/material.dart';

import '../../style/colors.dart';

class ScreenBackgroun extends StatelessWidget {
  final Widget widget;
  ScreenBackgroun({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height,
          color: colorGreen.withOpacity(.2),
        ),
        widget
      ],
    );
  }
}
