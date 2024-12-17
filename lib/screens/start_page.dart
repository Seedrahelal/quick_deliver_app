import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/screens/entring_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> iconAnimation;
  late Animation<double> textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    textAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 1)));
    iconAnimation = Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: controller, curve: const Interval(0, 1)));
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
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              AnimatedBuilder(
                  animation: textAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: textAnimation.value,
                      child: const Text(
                        "Hi , Welcome to     \n         Quick Deliver App ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
              const SizedBox(height: 460),
              SlideTransition(
                position: iconAnimation,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const EntringPage();
                        },
                      ));
                    },
                    icon: const Icon(
                      FontAwesomeIcons.personWalkingArrowRight,
                      size: 70,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

