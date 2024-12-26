import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType,
      this.isPassword = false,
      this.controller});
  final String hint;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(builder: (context) {
        return TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? isObscure : false,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is Required';
              } else {
                return null;
              }
            },
            cursorColor: const Color.fromARGB(255, 3, 46, 116),
            decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 158, 83, 3), fontSize: 18),
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder:
                    buildBorder(const Color.fromARGB(255, 3, 46, 116)),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                            shadows: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 251, 131, 3),
                                  blurRadius: 30,
                                  spreadRadius: 30)
                            ],
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: kPrimaryColor))
                    : null));
      }),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 5, color: color ?? kPrimaryColor));
  }
}
