import 'package:flutter/material.dart';
import 'package:quick_deliver/widgets/custom_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 15),
      children: const [
        Center(child: CustomCart()),
        Center(child: CustomCart()),
        Center(child: CustomCart()),
        Center(child: CustomCart()),
        Center(child: CustomCart()),
      ],
    );
  }
}
