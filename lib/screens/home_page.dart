import 'package:flutter/material.dart';
import 'package:quick_deliver_app/screens/settings_page.dart';
import 'package:quick_deliver_app/widgets/custom_app_bar.dart';
import 'package:quick_deliver_app/widgets/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(),
        ),
        drawer:  SettingsPage(),
        body: AnimatedSwitcher(
          duration:  Duration(milliseconds: 2000),
          switchInCurve: Curves.easeInOutCubic,
          switchOutCurve: Curves.easeInOutCubic,
        ),
        bottomNavigationBar:  CustomBottomBar());
  }
}
