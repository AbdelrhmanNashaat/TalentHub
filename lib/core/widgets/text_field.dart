import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import '../utils/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;
  final String? Function(String?)? validationValue;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color? hintTextColor;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final Color? errorColor;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.validationValue,
    required this.controller,
    this.keyboardType,
    this.fillColor,
    this.hintTextColor,
    this.suffixIcon,
    this.textStyle,
    this.errorColor,
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
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validationValue,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Constant.iconColor)
            : null,
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText
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
                : null),
        filled: true,
        fillColor: widget.fillColor ?? Constant.fillColor,
        hintText: widget.hintText,
        hintStyle: widget.textStyle ??
            CustomTextStyles.style16Medium.copyWith(
              fontSize: 14,
              color: widget.hintTextColor ?? Constant.iconColor,
            ),
        errorStyle: CustomTextStyles.style16Medium.copyWith(
          fontSize: 12,
          color: widget.errorColor ?? Colors.red,
        ),
        focusedBorder: borderMethod(),
        enabledBorder: borderMethod(),
        errorBorder: borderErrorMethod(),
        focusedErrorBorder: borderErrorMethod(),
      ),
    );
  }

  OutlineInputBorder borderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }

  OutlineInputBorder borderErrorMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    );
  }
}
