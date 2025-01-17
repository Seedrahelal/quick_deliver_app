import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/models/product_models.dart';

Future<dynamic> requestQuantity({
  required BuildContext context,
  required String text1,
  required String text2,
  required void Function(int) onPressed,
  int quantity = 1,
  required ProductModels product,
  required StateSetter setState,
  required bool isConfirmed,
}) {
  int selectedQuantity = quantity;
  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setDialogState) {
        return AlertDialog(
          title: Text(
            text1,
            style: const TextStyle(color: Color.fromARGB(255, 3, 47, 122)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text2,
                style: const TextStyle(color: Color.fromARGB(255, 3, 47, 122)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (selectedQuantity > 1) {
                        setDialogState(() {
                          if (selectedQuantity > 1) {
                            selectedQuantity--;
                          }
                        });
                      }
                    },
                    icon: const Icon(
                      FontAwesomeIcons.minus,
                      color: Color.fromARGB(255, 3, 47, 122),
                      size: 18,
                    ),
                  ),
                  Text(
                    "$selectedQuantity",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 47, 122),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setDialogState(() {
                        if (selectedQuantity < product.stockQuantity) {
                          selectedQuantity++;
                        }
                      });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      color: Color.fromARGB(255, 3, 47, 122),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 251, 131, 3),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onPressed.call(selectedQuantity);
              Navigator.pop(context);
              },
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 47, 122),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
