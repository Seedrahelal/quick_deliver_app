import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/screens/home_page.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';

void login(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 25,
              right: 25,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text('If you have an account...',
                    style: TextStyle(shadows: [
                      BoxShadow(
                          color: Color.fromARGB(255, 251, 131, 3),
                          blurRadius: 30,
                          spreadRadius: 20)
                    ], fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const CustomTextField(
                  hint: 'Phone Number :',
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                const SizedBox(height: 40),
                const CustomTextField(
                  hint: 'Password :',
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'Login',
                  color: kListColor,
                  colorText: Colors.white,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ));
                  },
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        );
      });
}
