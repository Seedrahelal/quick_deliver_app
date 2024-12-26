import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.textTitle,
  });
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 18, 42, 82),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          textTitle,
          style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                shadows: [
                  BoxShadow(
                      color: Color.fromARGB(255, 251, 131, 3),
                      blurRadius: 10,
                      spreadRadius: 10)
                ],
                FontAwesomeIcons.gears,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ),
    );
  }
}
