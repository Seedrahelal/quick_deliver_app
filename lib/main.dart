import 'package:flutter/material.dart';
import 'package:quick_deliver_app/screens/start_page.dart';

void main() {
  runApp(const QuickDeliver());
}

class QuickDeliver extends StatelessWidget {
  const QuickDeliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
