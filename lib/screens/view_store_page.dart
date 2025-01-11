// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quick_deliver/cubit/stores_cubit.dart';
// import 'package:quick_deliver/models/store_models.dart';
// import 'package:quick_deliver/widgets/grid_view_products.dart';
// import 'package:quick_deliver/widgets/slider_view.dart';

// class ViewStorePage extends StatelessWidget {
//   final StoreModels store;

//   const ViewStorePage({super.key, required this.store});

//   @override
//   Widget build(BuildContext context) {
//     context.read<StoresCubit>().getProducts(store.id);
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 BlocBuilder<StoresCubit, StoresState>(
//                   builder: (context, state) {
//                     if (state is ProductLoading) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (state is ProductSuccess) {
//                       final imageUrls = state.products
//                           .map((product) => product.productPicture)
//                           .toList();
//                       return SliderView(imageUrls: imageUrls);
//                     } else if (state is ProductFailure) {
//                       return Center(
//                         child: Text(
//                           'Error: ${state.errorMessage}',
//                           style: const TextStyle(color: Colors.red),
//                         ),
//                       );
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//                 const SizedBox(height: 40),
//                 Text(
//                   '* Description : ${store.description} ',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 3, 47, 122),
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   '* Location : ${store.location}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 3, 47, 122),
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   '* Phone Number : ${store.phone}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 3, 47, 122),
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 GridViewProducts(storeId: store.id),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_deliver/cubit/stores_cubit.dart';
import 'package:quick_deliver/models/store_models.dart';
import 'package:quick_deliver/widgets/grid_view_products.dart';
import 'package:quick_deliver/widgets/slider_view.dart';

class ViewStorePage extends StatefulWidget {
  final StoreModels store;

  const ViewStorePage({super.key, required this.store});

  @override
  State<ViewStorePage> createState() => _ViewStorePageState();
}

class _ViewStorePageState extends State<ViewStorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<StoresCubit>().getProducts(widget.store.id);
  }

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      context.read<StoresCubit>().searchProducts(widget.store.id, query);
    } else {
      context.read<StoresCubit>().getProducts(widget.store.id);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for a product...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: _onSearch,
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<StoresCubit, StoresState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductSuccess) {
                      final imageUrls = state.products
                          .map((product) => product.productPicture)
                          .toList();
                      return SliderView(imageUrls: imageUrls);
                    } else if (state is ProductFailure) {
                      return Center(
                        child: Text(
                          'Error: ${state.errorMessage}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 40),
                Text(
                  '* Description : ${widget.store.description} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '* Location : ${widget.store.location}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '* Phone Number : ${widget.store.phone}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                BlocBuilder<StoresCubit, StoresState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductSuccess) {
                      final products = state.products;
                      if (products.isEmpty) {
                        return const Center(
                          child: Text('No products found.'),
                        );
                      }
                      return GridViewProducts(
                        storeId: widget.store.id,
                      );
                    } else if (state is ProductFailure) {
                      return Center(
                        child: Text(
                          'Error: ${state.errorMessage}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
