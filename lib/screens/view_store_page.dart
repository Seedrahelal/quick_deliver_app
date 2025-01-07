import 'package:flutter/material.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '--> Abu Abdo juices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 46, 116),
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 16),
              SliderView(),
              SizedBox(height: 40),
              Text(
                '* Description : One of the oldest juice shops in Damascus🍎\nand a distinctive tourist attraction❤️',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 47, 122),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '* Location :(Salhiya) opposite the police station',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 47, 122),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '* Phone Number :0114444030',
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
