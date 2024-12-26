import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void productPage(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            shadowColor: const Color.fromARGB(255, 4, 48, 118),
            elevation: 200,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name Product',
                    style: TextStyle(
                      wordSpacing: 8,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 47, 122),
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 270,
                    width: 300,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 180, 122),
                        border: Border.all(color: const Color.fromARGB(255, 196, 104, 6), width: 3),
                        borderRadius: BorderRadius.circular(35)),
                    child: Image.asset(
                      'assets/store/photo_2024-12-22_15-16-53.jpg',
                      height: 260,
                      width: 290,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'price :  60000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 47, 122),
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'number of product :  20',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 47, 122),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Add to :',
                    style: TextStyle(
                        shadows: [
                          BoxShadow(
                              color: Color.fromARGB(255, 251, 131, 3),
                              blurRadius: 30,
                              spreadRadius: 30)
                        ],
                        color: Color.fromARGB(255, 3, 47, 122),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const RowWidget(
                      text: 'My Favorite  ---> ',
                      icon: FontAwesomeIcons.gratipay),
                  const RowWidget(
                      text: 'My Cart  ---> ', icon: FontAwesomeIcons.cartPlus)
                ],
              ),
            ));
      });
}

class RowWidget extends StatefulWidget {
  const RowWidget({
    super.key,
    required this.text,
    this.icon,
  });
  final String text;
  final dynamic icon;

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text,
            style: const TextStyle(
                fontSize: 26,
                color: Color.fromARGB(255, 3, 47, 122),
                fontWeight: FontWeight.bold)),
        IconButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            icon: Icon(
              widget.icon,
              color: isSelected
                  ? const Color.fromARGB(255, 196, 104, 6)
                  : const Color.fromARGB(255, 3, 47, 122),
              size: 30,
            ))
      ],
    );
  }
}
