import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/screens/settings_page.dart';
import 'package:quick_deliver/screens/store_page.dart';
import 'package:quick_deliver/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const StorePage(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(textTitle: 'Quick Deliver'),
        ),
        drawer: const SettingsPage(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOutCubic,
          switchOutCurve: Curves.easeInOutCubic,
          child: _pages[_currentIndex],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)
                ),
            color: Color.fromARGB(255, 18, 42, 82),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 12,
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
                  padding: EdgeInsets.all(isSelected ? 12 : 8),
                  decoration: isSelected
                      ? const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 111, 165, 252),
                              Color.fromARGB(255, 37, 65, 109),
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
                          shadows: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 251, 131, 3),
                                blurRadius: 10,
                                spreadRadius: 10)
                          ],
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
      ),
    );
  }
}

IconData _getIcon(int index) {
  switch (index) {
    case 0:
      return FontAwesomeIcons.shop;
    case 1:
      return FontAwesomeIcons.house;
    case 2:
      return FontAwesomeIcons.cartPlus;
    default:
      return FontAwesomeIcons.house;
  }
}

String _getLabel(int index) {
  switch (index) {
    case 0:
      return 'Store';
    case 1:
      return 'Home';
    case 2:
      return 'Cart';
    default:
      return '';
  }
}
