import 'package:flutter/material.dart';

class CustomRequest extends StatefulWidget {
  const CustomRequest({super.key});

  @override
  State<CustomRequest> createState() => _CustomRequestState();
}

class _CustomRequestState extends State<CustomRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: const Color.fromARGB(255, 196, 104, 6), width: 3),
        color: Colors.white,
      ),
      height: 130,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      padding: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          Text(
            "productName",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "From Store : Clothes",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
          Text(
            "Price : \$50 ",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
          Text(
            "Quantity : 2",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
          Text(
            "Total Price : \$100",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
        ],
      ),
    );
  }
}
