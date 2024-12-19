import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onTap,
      required this.text,
      required this.color,
      required this.colorText});
  final VoidCallback? onTap;
  final String text;
  final List<Color> color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: color),
            borderRadius: BorderRadius.circular(25)),
        height: 62,
        width: 170,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                shadows: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 251, 131, 3),
                      blurRadius: 30,
                      spreadRadius: 30)
                ],
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
