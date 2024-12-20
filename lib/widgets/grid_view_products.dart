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
            crossAxisSpacing: 7,
            mainAxisSpacing: 16),
        itemCount: 6,
        itemBuilder: (context, index) => CustomCard(
              height: 240,
              width: 200,
              widthCard: 170,
              name: 'fruit salad',
              photoPath: 'assets/store/images (1).jpg',
              onTap: () {
                productPage(context);
              },
            ));
  }
}
