import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_deliver/cubit/stores_cubit.dart';
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/screens/product_page.dart';
import 'package:quick_deliver/widgets/custom_card.dart';

class GridViewProducts extends StatelessWidget {
  final int storeId;
  const GridViewProducts({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          final products = state.products;
          if (products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 4,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return CustomCard(
                fontSizeText: 19,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 248, 169, 84),
                    blurRadius: 5,
                  ),
                ],
                boxBorder: Border.all(
                  width: 3,
                  color: const Color.fromARGB(255, 196, 104, 6),
                ),
                height: 240,
                width: 200,
                widthCard: 170,
                name: product.name,
                photoPath: '${EndPoint.url}${product.productPicture}',
                onTap: () {
                  productPage(context, product);
                },
              );
            },
          );
        } else if (state is ProductFailure) {
          return Center(
            child: Text('Error: ${state.errorMessage}'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
