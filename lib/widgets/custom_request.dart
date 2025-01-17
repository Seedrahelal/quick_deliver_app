import 'package:flutter/material.dart';

class CustomRequest extends StatelessWidget {
  const CustomRequest({
    super.key,
  });

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          Text(
            'productName',
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Price product:",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
          Text(
            "Quantity : ",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
          Text(
            "Total Price: ",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 65, 109),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomRequest extends StatelessWidget {
//   final String productName;
//   final double productPrice;
//   final int quantity;
//   final double totalPrice;

//   const CustomRequest({
//     super.key,
//     required this.productName,
//     required this.productPrice,
//     required this.quantity,
//     required this.totalPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border:
//             Border.all(color: const Color.fromARGB(255, 196, 104, 6), width: 3),
//         color: Colors.white,
//       ),
//       height: 130,
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       padding: const EdgeInsets.only(top: 10),
//       child: Column(
//         children: [
//           Text(
//             productName,
//             style: const TextStyle(
//               color: Color.fromARGB(255, 37, 65, 109),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             "Price product: \$${productPrice.toStringAsFixed(2)}",
//             style: const TextStyle(
//               color: Color.fromARGB(255, 37, 65, 109),
//             ),
//           ),
//           Text(
//             "Quantity: $quantity",
//             style: const TextStyle(
//               color: Color.fromARGB(255, 37, 65, 109),
//             ),
//           ),
//           Text(
//             "Total Price: \$${totalPrice.toStringAsFixed(2)}",
//             style: const TextStyle(
//               color: Color.fromARGB(255, 37, 65, 109),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
