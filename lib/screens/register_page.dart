import 'package:flutter/material.dart';
import 'package:quick_deliver_app/screens/home_page.dart';
import 'package:quick_deliver_app/widgets/custom_button.dart';
import 'package:quick_deliver_app/widgets/custom_text.dart';
import 'package:quick_deliver_app/widgets/pick_image_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 230, 230),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/photo.jpg'),
            const SizedBox(height: 10),
            const PickImageWidget(),
            CustomText(hintText: 'First Name :'),
            CustomText(hintText: 'Last Name :'),
            CustomText(hintText: 'Password', isPasswordField: true),
            CustomText(
              hintText: 'Phone Number :',
              inputType: const TextInputType.numberWithOptions(),
            ),
            CustomButton(
                text: 'Register',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return  HomePage();
                    },
                  ));
                }),
            const SizedBox(height: 30)
          ],
        ),
      ),
    ));
  }
}
