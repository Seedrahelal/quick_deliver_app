import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/cubit/stores_cubit.dart';
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/screens/view_store_page.dart';
import 'package:quick_deliver/widgets/custom_card.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StoresCubit>(context).getStores();
  }

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      BlocProvider.of<StoresCubit>(context).searchStores(query);
    } else {
      BlocProvider.of<StoresCubit>(context).getStores();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  FontAwesomeIcons.searchengin,
                  size: 24,
                ),
                hintText: 'Search for a store...',
                hintStyle: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 18, 42, 82)),
                suffixIconColor: const Color.fromARGB(255, 18, 42, 82),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: _onSearch,
            ),
          ),
          Expanded(
            child: BlocBuilder<StoresCubit, StoresState>(
              builder: (context, state) {
                if (state is StoreLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is StoreFailure) {
                  return Center(
                    child: Text('Error: ${state.errorMessage}'),
                  );
                } else if (state is StoreSuccess) {
                  final stores = state.stores;
                  // if (stores.isEmpty) {
                  //   return const Center(
                  //     child: Text('No stores found.'),
                  //   );
                  // }
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      final store = stores[index];
                      return CustomCard(
                        fontSizeText: 28,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 248, 169, 84),
                            blurRadius: 12,
                          ),
                        ],
                        height: 260,
                        width: 260,
                        widthCard: 250,
                        name: store.name,
                        photoPath: '${EndPoint.url}${store.photo}',
                        onTap: () {
                          print("Navigating to store ${store.name}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<StoresCubit>(
                                create: (_) => StoresCubit(),
                                child: ViewStorePage(store: store),
                              ),
                            ),
                          );
                          print("Navigating to store ${store.name}");
                        },
                      );
                    },
                  );
                }
                return const Center(child: Text('No Data'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
