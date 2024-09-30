import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';

import '../utils/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Constant.iconColor)
            : null,
        suffixIcon: widget.obscureText == true
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Constant.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Constant.fillColor,
        hintText: widget.hintText,
        hintStyle: CustomTextStyles.style16Medium.copyWith(
          fontSize: 14,
        ),
        focusedBorder: borderMethod(),
        enabledBorder: borderMethod(),
      ),
    );
  }

  OutlineInputBorder borderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
