import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/widgets/grid_view_products.dart';
import 'package:quick_deliver/widgets/slider_view.dart';

class ViewStorePage extends StatelessWidget {
  const ViewStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Abu Abdo juices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  color: kPrimaryColor,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 25),
              SliderView(),
              SizedBox(height: 40),
              Text(
                'One of the oldest juice shops in Damascus🍎\nand a distinctive tourist attraction❤️\n(Salhiya) opposite the police station 0114444030\n(Kfarsouseh) Damaskino Mall 0112166333 ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 47, 122),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              GridViewProducts()
            ],
          ),
        ),
      ),
    ));
  }
}
