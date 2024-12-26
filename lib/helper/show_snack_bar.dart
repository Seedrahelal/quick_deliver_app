import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 18, 42, 82),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      )));
}
