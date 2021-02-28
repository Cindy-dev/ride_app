import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double x;
  final double y;

  Spacing(this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: x,
      height: y,
    );
  }
}

extension CustomContext on BuildContext{
  double screenHeight([double percent = 1]) => MediaQuery.of(this).size.height * percent;
  double screenWidth([double percent = 1]) => MediaQuery.of(this).size.width * percent;

}