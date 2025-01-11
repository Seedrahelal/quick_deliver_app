import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/helper/show_top_message.dart';
import 'package:quick_deliver/screens/home_page.dart';
import 'package:quick_deliver/widgets/custom_button.dart';
import 'package:quick_deliver/widgets/custom_text_field.dart';

void login(BuildContext context) {
  final parentContext = context;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
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
      return Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showTopMessage(parentContext, 'Login Successful');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is LoginFailure) {
                showTopMessage(parentContext, state.errorMessage);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'If you have an account...',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 46, 116),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hint: 'Phone Number :',
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: phoneController,
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hint: 'Password :',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 50),
                    state is LoginLoading
                        ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 3, 46, 116),
                          )
                        : CustomButton(
                            text: 'Login',
                            height: 62,
                            width: 170,
                            color: kListColor,
                            colorText: Colors.white,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final phone = phoneController.text.trim();
                                final password = passwordController.text.trim();
                                context
                                    .read<UserCubit>()
                                    .login(phone, password);
                              }
                            },
                          ),
                    const SizedBox(height: 50),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
