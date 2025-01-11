import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/models/product_models.dart';

void productPage(BuildContext context, ProductModels product) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.only(left: 20, right: 20),
        shadowColor: const Color.fromARGB(255, 4, 48, 118),
        elevation: 200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: SizedBox(
          height: 720,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    wordSpacing: 8,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 248, 169, 84),
                        blurRadius: 5,
                      ),
                    ],
                    color: const Color.fromARGB(255, 235, 180, 122),
                    border: Border.all(
                      color: const Color.fromARGB(255, 196, 104, 6),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      product.productPicture,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  '* Description: ${product.description}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                Text(
                  '* ID : ${product.id.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                Text(
                  '* Price: ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                Text(
                  '* Number Of Product : ${product.stockQuantity}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Text(
                      "Buy now :",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(255, 251, 131, 3),
                            blurRadius: 30,
                            spreadRadius: 20,
                          ),
                        ],
                        color: Color.fromARGB(255, 3, 47, 122),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 47, 122),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      height: 40,
                      width: 155,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.cartPlus,
                          color: Colors.white,
                          size: 22,
                        ),
                        label: const Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Loved it :",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(255, 251, 131, 3),
                            blurRadius: 30,
                            spreadRadius: 20,
                          ),
                        ],
                        color: Color.fromARGB(255, 3, 47, 122),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 47, 122),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      height: 40,
                      width: 155,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.gratipay,
                          color: Colors.white,
                          size: 26,
                        ),
                        label: const Text(
                          'Favorite',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
