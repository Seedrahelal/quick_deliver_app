import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/screens/map_screen.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/pick_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  String firstName = 'Rama  ';
  String phone = '0912345678';
  String lastName = 'Azkoul';
  String password = '123456789';
  bool _obscureText = true;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameController.text = firstName;
    phoneController.text = phone;
    lastNameController.text = lastName;
    passwordController.text = password;
  }

  void saveChanges() {
    setState(() {
      firstName = firstNameController.text;
      phone = phoneController.text;
      lastName = lastNameController.text;
      password = passwordController.text;
      isEditing = false;
    });
  }

  void enableEditing() {
    setState(() {
      isEditing = true;
    });
  }

  Future<void> _pickImage() async {
    if (isEditing) {
      await ImagePicker().pickImage(source: ImageSource.gallery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
              child: Icon(FontAwesomeIcons.idCard,
                  color: Color.fromARGB(255, 37, 65, 109), size: 32),
            ),
          ],
          title: const Text(
            'My Profile ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 42, 82)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: kListColor)),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: isEditing ? _pickImage : null,
                          child: const PickWidget(
                            height: 130.0,
                            width: 130.0,
                            bottom: 20,
                            left: 85,
                            iconAvatar: Icons.camera_alt_sharp,
                            photoAvatar: AssetImage(
                                'assets/images/photo_2024-12-07_10-17-39 (3).jpg'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextField(
                              style: const TextStyle(
                                color: Color.fromARGB(255, 18, 42, 82),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              controller: firstNameController,
                              enabled: isEditing,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: const Text(
                                  'First Name:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 18, 42, 82),
                                  ),
                                ),
                                hintText: 'First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    width: 5,
                                    color: Color.fromARGB(255, 18, 42, 82),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Text(
                            'Last Name:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 18, 42, 82),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            style: const TextStyle(
                              color: Color.fromARGB(255, 18, 42, 82),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: lastNameController,
                            enabled: isEditing,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  width: 5,
                                  color: Color.fromARGB(255, 18, 42, 82),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: isEditing
                          ? () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const MapScreen();
                              }));
                            }
                          : null,
                      child: const PickWidget(
                        height: 115.0,
                        width: 115.0,
                        bottom: 5,
                        left: -2,
                        iconAvatar: Icons.add,
                        photoAvatar: AssetImage(
                            'assets/images/photo_2025-01-01_15-58-00.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(right: 190),
                child: Text(
                  'Phone Number :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 18, 42, 82),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 18, 42, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: phoneController,
                  enabled: isEditing,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Your Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 5,
                        color: Color.fromARGB(255, 18, 42, 82),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 190),
                child: Text(
                  'Your Password :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 18, 42, 82),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 18, 42, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: passwordController,
                  enabled: isEditing,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 5,
                        color: Color.fromARGB(255, 18, 42, 82),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              isEditing
                  ? Center(
                      child: CustomButton(height: 62,width: 170,
                        text: 'Save',
                        color: kListColor,
                        colorText: Colors.white,
                        onTap: saveChanges,
                      ),
                    )
                  : Center(
                      child: CustomButton(height: 62,width: 170,
                        text: 'Edit',
                        color: kListColor,
                        colorText: Colors.white,
                        onTap: enableEditing,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
