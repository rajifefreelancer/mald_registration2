import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';

class MyPleaseSpecify extends StatefulWidget {
  final FormFieldService formFieldElement;
  final String checkText;
  final String title;
  late TextEditingController controller;

  MyPleaseSpecify({
    super.key,
    required this.formFieldElement,
    required this.checkText,
    required this.title,
    required this.controller,
  });

  @override
  State<MyPleaseSpecify> createState() => _MyPleaseSpecifyState();
}

class _MyPleaseSpecifyState extends State<MyPleaseSpecify> {
  @override
  Widget build(BuildContext context) {
    return widget.formFieldElement == widget.checkText
        ? Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(widget.title),
                const SizedBox(height: 8.0),
                MyTextFormField(controller: widget.controller),
              ],
            ))
        : const SizedBox(height: 0);
  }
}
