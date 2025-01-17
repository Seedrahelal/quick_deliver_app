import 'package:flutter/material.dart';
import 'package:quick_deliver/widgets/custom_request.dart';

class MyRequest extends StatelessWidget {
  const MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [CustomRequest()],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quick_deliver/cubit/cubit/cart_cubit.dart';
// import 'package:quick_deliver/widgets/custom_request.dart';

// class MyRequest extends StatelessWidget {
//   const MyRequest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         final confirmedOrders = context.read<CartCubit>().getOrders(
//             token: "3|dyBj68tUHKb3qgh4jYKOUGVSE5LN47ChtM1oW2y92a23fc6f",
//             cartItemId: );

//         if (confirmedOrders.isEmpty) {
//           return const Center(
//             child: Text(
//               'No confirmed orders yet!',
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//           );
//         }

//         return ListView.builder(
//           itemCount: confirmedOrders.length,
//           itemBuilder: (context, index) {
//             final order = confirmedOrders[index];
//             final product = order['product'];
//             return CustomRequest(
//               productName: product.name,
//               productPrice: product.price,
//               quantity: order['quantity'],
//               totalPrice: order['totalPrice'],
//             );
//           },
//         );
//       },
//     );
//   }
// }
