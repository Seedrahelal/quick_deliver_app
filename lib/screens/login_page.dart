import 'package:flutter/material.dart';
import 'package:quick_deliver_app/screens/home_page.dart';
import 'package:quick_deliver_app/screens/register_page.dart';
import 'package:quick_deliver_app/widgets/custom_button.dart';
import 'package:quick_deliver_app/widgets/custom_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/photo_2024-12-05_11-06-36.jpg'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          padding:const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              CustomText(hintText: 'First name'),
              CustomText(hintText: 'Last name'),
              CustomText(
                  hintText: 'password',isPasswordField: true,
                  ),
              CustomButton(text: 'Login',onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ));
                    }),
              const SizedBox(height: 20),
              const Text("Don't have an account,",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ));
                },
                child:const Card(
                  color:  Color.fromARGB(255, 194, 183, 183),
                  elevation: 20,
                  child: Text('create account',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
