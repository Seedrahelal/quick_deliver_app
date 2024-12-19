import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_deliver/screens/map_screen.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';
import 'package:quick_deliver/widgets/pick_widget.dart';

void register(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    context: context,
    builder: (context) {
      return Padding(
          padding: EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  const Text('If you do not have an account...',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      PickWidget(
                        height: 190.0,
                        width: 190.0,
                        bottom: 40,
                        left: 120,
                        iconAvatar: Icons.camera_alt_sharp,
                        photoAvatar:
                            'assets/images/photo_2024-12-07_10-17-39 (4).jpg',
                        onTap: () async {
                          await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                        },
                      ),
                      PickWidget(
                        height: 115.0,
                        width: 115.0,
                        bottom: 5,
                        left: -2,
                        iconAvatar: Icons.add,
                        photoAvatar: 'assets/images/images.jpg',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const MapScreen();
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                  const CustomTextField(
                    hint: 'First Name :',
                  ),
                  const SizedBox(height: 40),
                  const CustomTextField(
                    hint: 'Last Name :',
                  ),
                  const SizedBox(height: 40),
                  const CustomTextField(
                    hint: 'Phone Number :',
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  const SizedBox(height: 40),
                  const CustomTextField(
                    hint: 'Password :',
                    isPassword: true,
                  ),
                  const SizedBox(height: 40),
                  const Center(
                    child: CustomButton(
                        text: 'Register',
                        color: Color(0xff516585),
                        colorText: Colors.white),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ));
    },
  );
}
