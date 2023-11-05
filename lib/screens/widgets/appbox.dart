import 'package:flutter/material.dart';

class AppBox extends StatelessWidget {
  const AppBox(
      {super.key,
      this.child,
      this.widthP,
      this.heightP,
      this.showColor = true,
      this.wminusPx,
      this.hminusPx,
      this.color,
      this.widthPx,
      this.heightPx,
      this.minusAppBarHeight = false})
      : assert(widthP == null || widthPx == null),
        assert(heightP == null || heightPx == null);

  final Widget? child;
  final double? widthP;
  final double? heightP;
  final double? widthPx;
  final double? heightPx;
  final double? wminusPx;
  final double? hminusPx;
  final bool showColor;
  final Color? color;
  final bool minusAppBarHeight;

  @override
  Widget build(BuildContext context) {
    double? boxWidth;
    double? boxHeight;

    if (widthP != null) boxWidth = MediaQuery.of(context).size.width * (widthP! * .01);
    if (heightP != null) boxHeight = MediaQuery.of(context).size.height * (heightP! * .01);
    if (widthPx != null) boxWidth = widthPx;
    if (heightPx != null) boxHeight = heightPx;

    if (boxWidth != null && wminusPx != null) {
      boxWidth = boxWidth - wminusPx!;
    }
    if (boxHeight != null && hminusPx != null) {
      boxHeight = boxHeight - hminusPx!;
    }
    if (boxWidth != null && boxWidth < 0) boxWidth = null;
    if (boxHeight != null && boxHeight < 0) boxHeight = null;

    double appBarHeight = AppBar().preferredSize.height;
    if (minusAppBarHeight != false) {
      if (boxHeight != null && boxHeight > appBarHeight) {
        boxHeight -= appBarHeight;
      }
    }

    return showColor == false
        ? SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: child,
          )
        : Container(
            width: boxWidth,
            height: boxHeight,
            color: color ?? generateRandomColor().withAlpha(100),
            child: child,
          );
  }
}

// Function to generate a random color.
int colorOrder = 0;
Color generateRandomColor() {
  List colors = [
    const Color.fromARGB(255, 156, 120, 214),
    const Color.fromARGB(255, 201, 121, 177),
    const Color.fromRGBO(255, 111, 145, 1.0),
    const Color.fromRGBO(255, 150, 113, 1.0),
    const Color.fromRGBO(255, 199, 95, 1.0),
    const Color.fromRGBO(249, 248, 113, 1.0),
    const Color.fromARGB(255, 193, 162, 112),
    const Color.fromARGB(255, 163, 225, 111),
    const Color.fromARGB(255, 70, 183, 126),
    const Color.fromARGB(255, 85, 197, 220),
    const Color.fromARGB(255, 164, 164, 164),
  ];
  colorOrder++;
  if (colorOrder < colors.length) {
    return colors[colorOrder];
  } else {
    colorOrder = 0;
    return colors[colorOrder];
  }
}
