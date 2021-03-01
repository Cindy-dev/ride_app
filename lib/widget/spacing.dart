import 'package:flutter/material.dart';

class SpacingWidth extends StatelessWidget {
  final double x;

  SpacingWidth(this.x);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: x,
    );
  }
}
class SpacingHeight extends StatelessWidget {
  final double y;

  SpacingHeight(this.y);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: y,
    );
  }
}

extension CustomContext on BuildContext{
  double screenHeight([double percent = 1]) => MediaQuery.of(this).size.height * percent;
  double screenWidth([double percent = 1]) => MediaQuery.of(this).size.width * percent;

}