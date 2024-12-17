import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';

class EntringPage extends StatefulWidget {
  const EntringPage({super.key});

  @override
  State<EntringPage> createState() => _EntringPageState();
}

class _EntringPageState extends State<EntringPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> iconAnimation;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    textOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.5)));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/photo_2024-12-17_12-18-09.jpg'),
                fit: BoxFit.cover)),
        child: AnimatedBuilder(
            animation: textOpacity,
            builder: (context, child) {
              return Opacity(
                opacity: textOpacity.value,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                        "All Your Requests       \n      Are About Us😍 ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 310),
                    CustomButton(
                      text: 'Login',
                      colorText: kPrimaryColor,
                      color: Colors.white,
                      onTap: () {
                        login();
                      },
                    ),
                    CustomButton(
                      text: 'Register',
                      colorText: kPrimaryColor,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            }),
      ),
    ));
  }

  void login() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
                bottom: MediaQuery.of(context).viewInsets.bottom + 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text('If you have an account...',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const CustomTextField(
                    hint: 'Phone Number :',
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 40),
                  const CustomTextField(
                    hint: 'Password :',isPassword: true,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                      text: 'Login',
                      color: const Color(0xff516585),
                      colorText: Colors.white),
                ],
              ),
            ),
          );
        });
  }
}
