import 'package:flutter/material.dart';

class MyDropdownFormField extends StatelessWidget {
  final String? dropdownValue;
  final void Function(String?)? onChange;
  final List<DropdownMenuItem<String>>? dropdownItems;
  final String? Function(String?)? validate;
  final bool isDense;
  const MyDropdownFormField({
    super.key,
    required this.dropdownValue,
    required this.onChange,
    required this.dropdownItems,
    this.validate,
    required this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        //isDense: false,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
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
        //contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        filled: true,
        fillColor: Colors.white,
      ),
      isDense: isDense,
      value: dropdownValue,
      items: dropdownItems,
      onChanged: onChange,
      validator: validate,
    );
  }
}
