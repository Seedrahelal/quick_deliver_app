import 'package:flutter/material.dart';
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
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text('If you have an account...',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextField(
                  hint: 'Phone Number :',
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                SizedBox(height: 40),
                CustomTextField(
                  hint: 'Password :',
                  isPassword: true,
                ),
                SizedBox(height: 50),
                CustomButton(
                    text: 'Login',
                    color: Color(0xff516585),
                    colorText: Colors.white),
                SizedBox(height: 50)
              ],
            ),
          ),
        );
      });
}
