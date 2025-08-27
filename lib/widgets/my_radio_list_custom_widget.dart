import 'package:flutter/material.dart';

class MyRadioCustom extends StatelessWidget {
  final Widget? radioTitle;
  final Widget? radioSubTitle;
  final String? radioGroupValue;
  final void Function(String?)? onChange;
  const MyRadioCustom({
    super.key,
    required this.radioTitle,
    this.radioSubTitle,
    required this.radioGroupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: radioTitle,
      subtitle: radioSubTitle,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: "Yes",
            groupValue: radioGroupValue,
            onChanged: onChange,
          ),
          const SizedBox(width: 10),
          Radio(
            value: "No",
            groupValue: radioGroupValue,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
