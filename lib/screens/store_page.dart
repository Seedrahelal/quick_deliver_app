import 'package:flutter/material.dart';
import 'package:quick_deliver/screens/view_store_page.dart';
import 'package:quick_deliver/widgets/custom_card.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewStorePage()));
            }),
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 169, 84), blurRadius: 12)
            ],
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
      ],
    );
  }
}
