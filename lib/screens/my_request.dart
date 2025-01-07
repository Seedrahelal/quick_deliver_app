import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_request.dart';

class MyRequest extends StatelessWidget {
  const MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FontAwesomeIcons.angleLeft,
              color: Color.fromARGB(255, 18, 42, 82),
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.jediOrder,
                color: Color.fromARGB(255, 37, 65, 109), size: 32),
          ),
        ],
        title: const Text(
          'My Requests ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 18, 42, 82)),
        ),
      ),
      bottomNavigationBar: Container(
        height: 160,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12,
              offset: Offset(0, -4),
            )
          ],
        ),
        child: const Column(
          children: [
            Divider(
              color: Color.fromARGB(255, 37, 65, 109),
              thickness: 3,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sub Total ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 37, 65, 109),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "\$500.86",
                  style: TextStyle(
                    color: Color.fromARGB(255, 196, 104, 6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Delivery ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 37, 65, 109),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "\$14",
                  style: TextStyle(
                    color: Color.fromARGB(255, 196, 104, 6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Total ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 37, 65, 109),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "\$501.0",
                  style: TextStyle(
                    color: Color.fromARGB(255, 196, 104, 6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 17),
            CustomButton(
                height: 45,
                width: 220,
                textSize: 20,
                text: "Bay Now",
                color: kListColor2,
                colorText: Colors.white),
          ],
        ),
      ),
      body: ListView(
        children: const [
          CustomRequest(),
          CustomRequest(),
          CustomRequest(),
          CustomRequest(),
          CustomRequest(),
          CustomRequest(),
        ],
      ),
    ));
  }
}
