import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/helper/show_top_message.dart';
import 'package:quick_deliver/screens/home_page.dart';
import 'package:quick_deliver/screens/map_screen.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';
import 'package:quick_deliver/widgets/pick_widget.dart';

void register(BuildContext context) {
  final parentContext = context;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  File? selectImage;
  String? selectLocation;
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showTopMessage(context, 'Registration Successful');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is RegisterFailure) {
                showTopMessage(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 25,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 590,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'If you do not have an account...',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 46, 116),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PickWidget(
                                height: 115.0,
                                width: 115.0,
                                bottom: 0,
                                left: 0,
                                iconAvatar: Icons.camera_alt,
                                photoAvatar: selectImage != null
                                    ? FileImage(selectImage!)
                                    : const AssetImage(
                                        'assets/images/photo_2024-12-07_10-17-39 (3).jpg'),
                                onTap: () async {
                                  final picker = ImagePicker();
                                  final pickedFile = await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (pickedFile != null) {
                                    setState(() {
                                      selectImage = File(pickedFile.path);
                                    });
                                  }
                                },
                              ),
                              const SizedBox(width: 20),
                              PickWidget(
                                height: 115.0,
                                width: 115.0,
                                bottom: 0,
                                left: 0,
                                iconAvatar: Icons.location_on,
                                photoAvatar: const AssetImage(
                                    'assets/images/photo_2025-01-01_15-58-00.jpg'),
                                onTap: () async {
                                  final location = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MapScreen(),
                                    ),
                                  );
                                  if (location != null) {
                                    setState(() {
                                      selectLocation = location.toString();
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hint: 'First Name :',
                            controller: firstNameController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hint: 'Last Name :',
                            controller: lastNameController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hint: 'Phone Number :',
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hint: 'Password :',
                            isPassword: true,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hint: 'Confirm Password :',
                            isPassword: true,
                            controller: confirmPasswordController,
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: state is RegisterLoading
                                ? const CircularProgressIndicator(
                                    color: Color.fromARGB(255, 3, 46, 116),
                                  )
                                : CustomButton(
                                    height: 62,
                                    width: 170,
                                    text: 'Register',
                                    color: kListColor,
                                    colorText: Colors.white,
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        if (selectLocation != null &&
                                            selectImage != null) {
                                          context.read<UserCubit>().register(
                                                firstName: firstNameController
                                                    .text
                                                    .trim(),
                                                lastName: lastNameController
                                                    .text
                                                    .trim(),
                                                phone:
                                                    phoneController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                                confirmPassword:
                                                    confirmPasswordController
                                                        .text
                                                        .trim(),
                                                location: selectLocation!,
                                                image: selectImage!,
                                              );
                                        } else {
                                          showTopMessage(
                                            context,
                                            'Please select an image and location.',
                                          );
                                        }
                                      }
                                    },
                                  ),
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
