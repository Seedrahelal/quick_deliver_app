import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onTap,
      required this.text,
      required this.color,
      required this.colorText,
      required this.height,
      required this.width,
      this.textSize = 30});
  final VoidCallback? onTap;
  final String text;
  final List<Color> color;
  final Color colorText;
  final double height;
  final double width;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: color),
            borderRadius: BorderRadius.circular(25)),
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize,
                color: colorText,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
