import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/screens/login_page.dart';
import 'package:quick_deliver/screens/register_page.dart';
import 'package:quick_deliver/widgets/custom_button.dart';

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
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 16, top: 25, bottom: 70),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      const Text("All  Your  Requests\nAre  About  Us   ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const Spacer(flex: 1),
                      CustomButton(
                        text: 'Login',
                        height: 62,
                        width: 170,
                        colorText: Colors.white,
                        color: kListColor,
                        onTap: () {
                          login(context);
                        },
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        text: 'Register',
                        height: 62,
                        width: 170,
                        colorText: Colors.white,
                        color: kListColor,
                        onTap: () {
                          register(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
