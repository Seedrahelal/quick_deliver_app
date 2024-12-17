import 'package:flutter/material.dart';
import 'package:quick_deliver/screens/start_page.dart';

void main() {
  runApp(const QuickDeliver());
}

class QuickDeliver extends StatelessWidget {
  const QuickDeliver({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}