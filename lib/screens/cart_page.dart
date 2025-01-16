import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_deliver/cubit/cubit/cart_cubit.dart';
import 'package:quick_deliver/widgets/custom_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 15),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final cartItem = state.products[index];
              final product = cartItem['product'];
              final quantity = cartItem['quantity'];
              final totalPrice = cartItem['totalPrice'];
              final cartId = cartItem['id'];
              return CustomCart(
                cartId: cartId,
                product: product,
                quantity: quantity,
                totalPrice: totalPrice,
              );
            },
          );
        } else if (state is CartFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text('No products in cart.'));
      },
    );
  }
}
