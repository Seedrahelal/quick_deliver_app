import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  CustomText({
    this.hintText,
    this.inputType,
    this.onchanged,
    this.isPasswordField = false,
  });

  final String? hintText;
  final TextInputType? inputType;
  final Function(String)? onchanged;
  final bool isPasswordField;
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  FocusNode _focusNode = FocusNode();
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23),
      child: SizedBox(
        height: 80,
        child: TextFormField(
          focusNode: _focusNode,
          obscureText: widget.isPasswordField ? _obscureText : false,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Field is Required';
            } else {
              return null;
            }
          },
          keyboardType: widget.inputType,
          onChanged: widget.onchanged,
          decoration: InputDecoration(
            hintText: '${widget.hintText} ...',
            hintStyle: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 116, 33, 51), width: 4),
              borderRadius: BorderRadius.circular(16),
            ),
            filled: _focusNode.hasFocus,
            fillColor:
                _focusNode.hasFocus ? const Color.fromARGB(255, 172, 161, 161) : Colors.transparent,
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
