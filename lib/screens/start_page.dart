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
  late Animation<Offset> _iconAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 1)));
    _iconAnimation = Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
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
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 16, top: 25, bottom: 70),
            child: Column(
              children: [
                AnimatedBuilder(
                    animation: _textAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _textAnimation.value,
                        child: const Text(
                          "Hi ,\nWelcome  to\n  Quick  Deliver  App   ",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
                const Spacer(flex: 1),
                SlideTransition(
                  position: _iconAnimation,
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
      ),
    );
  }
}
