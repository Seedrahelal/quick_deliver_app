import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {required this.name,
      required this.photoPath,
      required this.onTap,
      required this.width,
      required this.height,
      required this.widthCard});
  final String name;
  final String photoPath;
  final dynamic onTap;
  final double width;
  final double widthCard;

  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Stack(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 248, 169, 84),
                            blurRadius: 30)
                      ]),
                  child: Image.asset(photoPath, fit: BoxFit.cover)),
              Positioned(
                bottom: 0,
                left: 0,
                height: 70,
                width: widthCard,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
                  shadowColor: const Color.fromARGB(255, 3, 38, 95),
                  color: kPrimaryColor,
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
