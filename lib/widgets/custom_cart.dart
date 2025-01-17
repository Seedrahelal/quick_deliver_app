import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_deliver/cubit/cubit/cart_cubit.dart';
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/helper/request_quantity.dart';
import 'package:quick_deliver/models/product_models.dart';

class CustomCart extends StatefulWidget {
  final ProductModels product;
  final int quantity;
  final int totalPrice;
  final int cartId;

  const CustomCart({
    super.key,
    required this.product,
    required this.cartId,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {
    bool isConfirmed = false;
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: 250,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                context.read<CartCubit>().confirmOrder(
                    token: "3|dyBj68tUHKb3qgh4jYKOUGVSE5LN47ChtM1oW2y92a23fc6f", cartItemId: widget.cartId);
              },
              icon: const Icon(
                Icons.done,
                size: 30,
                color: Color.fromARGB(255, 2, 120, 4),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  '${EndPoint.url}${widget.product.productPicture}',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    wordSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 37, 65, 109),
                  ),
                ),
                Text(
                  'Quantity: ${widget.quantity}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 37, 65, 109),
                  ),
                ),
                Text(
                  '\$${widget.totalPrice}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 206, 108, 2),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(colors: kListColor)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        requestQuantity(
                          context: context,
                          isConfirmed: isConfirmed,
                          product: widget.product,
                          quantity: 1,
                          setState: setState,
                          text1: 'Edit Quantity',
                          text2: 'Choose New Quantity:',
                          onPressed: (int selectedQuantity) {
                            context.read<CartCubit>().updateProductQuantity(
                                  token:"3|dyBj68tUHKb3qgh4jYKOUGVSE5LN47ChtM1oW2y92a23fc6f",
                                  cartItemId: widget.cartId,
                                  newQuantity: selectedQuantity,
                                );
                            setState(() {
                              isConfirmed = true;
                            });
                          },
                        );
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                context.read<CartCubit>().cancelOrder(
                      token:"3|dyBj68tUHKb3qgh4jYKOUGVSE5LN47ChtM1oW2y92a23fc6f",
                      cartItemId: widget.cartId,
                    );
              },
              icon: const Icon(
                Icons.cancel_outlined,
                size: 30,
                color: Color.fromARGB(255, 197, 103, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
