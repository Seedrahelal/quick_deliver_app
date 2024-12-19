import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/screens/view_store_page.dart';
import 'package:quick_deliver/widgets/custom_card.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            const Text(
              'Find Stores Here ....',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.searchengin, size: 32))
          ],
        ),
        const SizedBox(height: 26),
        CustomCard(
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
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
            height: 260,
            width: 260,
            widthCard: 250,
            name: 'Abu Abdo juices',
            photoPath: 'assets/store/images.jpg',
            onTap: () {}),
        CustomCard(
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
