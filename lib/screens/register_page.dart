import 'package:flutter/material.dart';
import 'package:quick_deliver_app/widgets/pick_image_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/photo.jpg'),
            const SizedBox(height: 10),
            const PickImageWidget()
          ],
        ),
      ),
    ));
  }
}
