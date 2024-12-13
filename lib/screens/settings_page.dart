import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver_app/helper/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 156, 85, 100),
                Color.fromARGB(255, 107, 9, 30),
              ],
            )),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(FontAwesomeIcons.idCard,
                color: Colors.white, size: 35),
            title: const Text('My Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(FontAwesomeIcons.gratipay,
                color: Colors.white, size: 35),
            title: const Text('My Favorites',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(FontAwesomeIcons.cartPlus,
                color: Colors.white, size: 35),
            title: const Text('Shopping Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(FontAwesomeIcons.globe,
                color: Colors.white, size: 35),
            title: const Text('Language',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
