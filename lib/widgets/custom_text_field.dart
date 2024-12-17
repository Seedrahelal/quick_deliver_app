import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.color,
      this.isPassword = false});
  final String hint;
  final Color color;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(builder: (context) {
        final hasfocus = Focus.of(context).hasFocus;
        return TextFormField(
            obscureText: widget.isPassword ? isObscure : false,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is Required';
              } else {
                return null;
              }
            },
            cursorColor: widget.color,
            decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 18),
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(hasfocus
                    ? const Color.fromARGB(255, 3, 46, 116)
                    : kPrimaryColor),
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
