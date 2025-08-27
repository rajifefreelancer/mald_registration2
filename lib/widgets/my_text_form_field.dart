import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final bool? enabled;
  final Function(String)? onChange;

  const MyTextFormField({
    super.key,
    this.validate,
    this.controller,
    this.enabled,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        isDense: true,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xffa8b1ce)),
          borderRadius: BorderRadius.circular(4.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xffa8b1ce)),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Color(0xff5a81fa)),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(4.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validate,
      onChanged: onChange,
    );
  }
}
