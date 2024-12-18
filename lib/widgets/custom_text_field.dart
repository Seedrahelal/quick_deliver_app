import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType,
      this.isPassword = false});
  final String hint;
  final bool isPassword;
  final TextInputType? keyboardType;

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
                hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 18),
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
