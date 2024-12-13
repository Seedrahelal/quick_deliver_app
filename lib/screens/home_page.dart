import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver_app/helper/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Quick Deliver',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.gears,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
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
                  style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(FontAwesomeIcons.gratipay,
                  color: Colors.white, size: 35),
              title: const Text('My Favorites',
                  style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(FontAwesomeIcons.cartPlus,
                  color: Colors.white, size: 35),
              title: const Text('Shopping Cart',
                  style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(FontAwesomeIcons.globe,
                  color: Colors.white, size: 35),
              title: const Text('Language',
                  style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1500),
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: const BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(0, -4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            bool isSelected = _currentIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutBack,
                padding: EdgeInsets.all(isSelected ? 10 : 8),
                decoration: isSelected
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 172, 109, 123),
                            Color.fromARGB(255, 116, 33, 51),
                          ],
                        ),
                        shape: BoxShape.circle,
                      )
                    : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getIcon(index),
                      size: 24,
                      color: isSelected
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.white,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getLabel(index),
                      style: TextStyle(
                        color: isSelected
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.house;
      case 1:
        return FontAwesomeIcons.shop;
      case 2:
        return FontAwesomeIcons.basketShopping;
      default:
        return FontAwesomeIcons.house;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Store';
      case 2:
        return 'Items';
      default:
        return '';
    }
  }
}
