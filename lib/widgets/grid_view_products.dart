import 'package:flutter/material.dart';
import 'package:quick_deliver/screens/product_page.dart';
import 'package:quick_deliver/widgets/custom_card.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 4),
        itemCount: 6,
        itemBuilder: (context, index) => CustomCard(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 248, 169, 84), blurRadius: 5)
              ],
              boxBorder: Border.all(
                  width: 3, color: const Color.fromARGB(255, 196, 104, 6)),
              height: 240,
              width: 200,
              widthCard: 170,
              name: 'fruit salad',
              photoPath: 'assets/store/photo_2024-12-22_15-16-53.jpg',
              onTap: () {
                productPage(context);
              },
            ));
  }
}
