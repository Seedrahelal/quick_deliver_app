import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/helper/constants.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({super.key});

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: 250,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.done,
                size: 28,
                color: Color.fromARGB(255, 2, 120, 4),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/store/photo_2024-12-22_15-16-53.jpg",
                  height: 150,
                  width: 150,
                ),
                const Text("product Name",
                    style: TextStyle(
                      wordSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 37, 65, 109),
                    )),
                const Text("\$50",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 206, 108, 2),
                    )),
                const SizedBox(height: 8),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(colors: kListColor)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if(quantity>0){
                              quantity--;}
                            });
                          },
                          icon: const Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                            size: 18,
                          )),
                      Text("$quantity",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 18,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cancel_outlined,
                size: 28,
                color: Color.fromARGB(255, 197, 103, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
