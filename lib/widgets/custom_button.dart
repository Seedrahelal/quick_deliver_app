import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onTap,
      required this.text,
      required this.color,
      required this.colorText});
  final VoidCallback? onTap;
  final String text;
  final Color color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        height: 62,
        width: 160,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 30,
                color: colorText,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
