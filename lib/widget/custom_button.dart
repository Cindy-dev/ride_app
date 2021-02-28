import 'package:flutter/material.dart';
import '../models/app_colors.dart';

class CustomButtton extends StatelessWidget {
  final onPressed;
  final String text;
  final double width;
  CustomButtton({this.onPressed, this.text, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration:BoxDecoration(
        color: AppColors.designColor, 
        borderRadius: BorderRadius.circular(50),
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical:20,horizontal:50), 
        child: Text(text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}