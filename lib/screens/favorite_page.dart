import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<Map<String, String>> products = [
    {
      'name': "first",
      'image': "assets/images/photo_2024-12-07_10-17-39 (3).jpg",
    },
    {
      'name': "second",
      'image': "assets/images/photo_2024-12-17_12-18-09.jpg",
    },
    {
      'name': "third",
      'image': "assets/images/photo_2025-01-01_15-58-00.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Icon(Icons.favorite),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 15, 133, 58),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 131, 233, 150),
                              blurRadius: 8,
                              spreadRadius: 4),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.remove_circle_outline_outlined),
                        Image(
                          image: AssetImage(
                            products[index]['image']!,
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
