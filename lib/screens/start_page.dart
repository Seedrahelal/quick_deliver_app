import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/photo_2024-12-05_11-06-36.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: const Text(
                    "Hi , Welcome to     \n        Quick Deliver App",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Pacifico',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 470),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_right,
                      size: 70,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
