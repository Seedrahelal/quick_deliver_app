import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.onTap,
      required this.text,
      required this.color,
      required this.colorText});
  VoidCallback? onTap;
  String text;
  Color color;
  Color colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16)),
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
      ),
    );
  }
}
