import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  CustomText({
    this.hintText,
    this.inputType,
    this.onchanged,
  });

  final String? hintText;
  final TextInputType? inputType;
  final Function(String)? onchanged;

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  FocusNode _focusNode = FocusNode();

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
                _focusNode.hasFocus ? Colors.grey[200] : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
