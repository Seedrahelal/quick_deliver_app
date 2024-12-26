// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:quick_deliver/cubit/user_cubit.dart';
// import 'package:quick_deliver/helper/constants.dart';
// import 'package:quick_deliver/helper/show_snack_bar.dart';
// import 'package:quick_deliver/screens/home_page.dart';
// import 'package:quick_deliver/screens/map_screen.dart';
// import 'package:quick_deliver/widgets/custom_button.dart';
// import 'package:quick_deliver/widgets/custom_text_field.dart';
// import 'package:quick_deliver/widgets/pick_widget.dart';

// void register(BuildContext context) {
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   File? selectImage;
//   String? selectLocation;
//   final formKey = GlobalKey<FormState>();

//   showModalBottomSheet(
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//     context: context,
//     builder: (context) {
//       return BlocConsumer<UserCubit, UserState>(
//         listener: (context, state) {
//           if (state is RegisterSuccess) {
//             showSnackBar(context, 'Registration Successful');
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const HomePage(),
//               ),
//             );
//           } else if (state is RegisterFailure) {
//             showSnackBar(context, state.errorMessage);
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//               padding: EdgeInsets.only(
//                   top: 25,
//                   left: 25,
//                   right: 25,
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: SingleChildScrollView(
//                 child: SizedBox(
//                   height: 550,
//                   child: ListView(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     children: [
//                       const Text('If you do not have an account...',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 3, 46, 116),
//                               shadows: [
//                                 BoxShadow(
//                                     color: Color.fromARGB(255, 251, 131, 3),
//                                     blurRadius: 30,
//                                     spreadRadius: 20)
//                               ],
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold)),
//                       Row(
//                         children: [
//                           PickWidget(
//                             height: 190.0,
//                             width: 190.0,
//                             bottom: 40,
//                             left: 120,
//                             iconAvatar: Icons.camera_alt_sharp,
//                             photoAvatar: selectImage != null
//                                 ? selectImage!.path
//                                 : 'assets/images/photo_2024-12-07_10-17-39 (4).jpg',
//                             onTap: () async {
//                               final picker = ImagePicker();
//                               final pickedFile = await picker.pickImage(
//                                   source: ImageSource.gallery);
//                               if (pickedFile != null) {
//                                 selectImage = File(pickedFile.path);
//                                 (context as Element).markNeedsBuild();
//                               }
//                             },
//                           ),
//                           PickWidget(
//                             height: 115.0,
//                             width: 115.0,
//                             bottom: 5,
//                             left: -2,
//                             iconAvatar: Icons.add,
//                             photoAvatar: 'assets/images/images.jpg',
//                             onTap: () async {
//                               final location = await Navigator.push(context,
//                                   MaterialPageRoute(
//                                 builder: (context) {
//                                   return const MapScreen();
//                                 },
//                               ));
//                               selectLocation = location;
//                             },
//                           ),
//                         ],
//                       ),
//                       CustomTextField(
//                         hint: 'First Name :',
//                         controller: firstNameController,
//                       ),
//                       const SizedBox(height: 40),
//                       CustomTextField(
//                         hint: 'Last Name :',
//                         controller: lastNameController,
//                       ),
//                       const SizedBox(height: 40),
//                       CustomTextField(
//                         hint: 'Phone Number :',
//                         keyboardType: const TextInputType.numberWithOptions(),
//                         controller: phoneController,
//                       ),
//                       const SizedBox(height: 40),
//                       CustomTextField(
//                         hint: 'Password :',
//                         isPassword: true,
//                         controller: passwordController,
//                       ),
//                       const SizedBox(height: 40),
//                       Center(
//                         child: state is RegisterLoading
//                             ? const CircularProgressIndicator(
//                                 color: Color.fromARGB(255, 3, 46, 116),
//                               )
//                             : CustomButton(
//                                 text: 'Register',
//                                 color: kListColor,
//                                 colorText: Colors.white,
//                                 onTap: () {
//                                     if (selectLocation != null &&
//                                         selectImage != null) {
//                                       context.read<UserCubit>().register(
//                                           firstName:
//                                               firstNameController.text.trim(),
//                                           lastName:
//                                               lastNameController.text.trim(),
//                                           phone: phoneController.text.trim(),
//                                           password:
//                                               passwordController.text.trim(),
//                                           location: selectLocation!,
//                                           image: selectImage!);
//                                     } else {
//                                       showSnackBar(context,
//                                           'Please select an image and location');
//                                     }

//                                 },
//                               ),
//                       ),
//                       const SizedBox(height: 70),
//                     ],
//                   ),
//                 ),
//               ));
//         },
//       );
//     },
//   );
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/helper/show_snack_bar.dart';
import 'package:quick_deliver/screens/home_page.dart';
import 'package:quick_deliver/screens/map_screen.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';
import 'package:quick_deliver/widgets/pick_widget.dart';

void register(BuildContext context) {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
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
                showSnackBar(context, 'Registration Successful');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is RegisterFailure) {
                showSnackBar(context, state.errorMessage);
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
                    child: Column(
                      children: [
                        const Text(
                          'If you do not have an account...',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 46, 116),
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(255, 251, 131, 3),
                                blurRadius: 30,
                                spreadRadius: 20,
                              ),
                            ],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PickWidget(
                              height: 120.0,
                              width: 120.0,
                              bottom: 5,
                              left: 5,
                              iconAvatar: Icons.camera_alt,
                              photoAvatar: selectImage != null
                                  ? selectImage!.path
                                  : 'assets/images/photo_2024-12-07_10-17-39 (4).jpg',
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
                              height: 120.0,
                              width: 120.0,
                              bottom: 5,
                              left: 5,
                              iconAvatar: Icons.location_on,
                              photoAvatar: 'assets/images/images.jpg',
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
                        const SizedBox(height: 40),
                        Center(
                          child: state is RegisterLoading
                              ? const CircularProgressIndicator()
                              : CustomButton(
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
                                              lastName: lastNameController.text
                                                  .trim(),
                                              phone:
                                                  phoneController.text.trim(),
                                              password: passwordController.text
                                                  .trim(),
                                              location: selectLocation!,
                                              image: selectImage!,
                                            );
                                      } else {
                                        showSnackBar(
                                          context,
                                          'Please select an image and location.',
                                        );
                                      }
                                    }
                                  },
                                ),
                        ),
                        const SizedBox(height: 40),
                      ],
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
