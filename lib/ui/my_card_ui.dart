import 'package:flutter/material.dart';
import 'package:mald_registration_app02/widgets/my_divider_widget.dart';

class MyCardUi extends StatefulWidget {
  final bool cardAgree;
  final String cardName;
  final List<Widget>? cardWidgets;
  final Widget? inCardWidget1;
  final Widget? inCardWidget2;

  const MyCardUi({
    super.key,
    required this.cardAgree,
    required this.cardName,
    this.cardWidgets,
    this.inCardWidget1,
    this.inCardWidget2,
  });

  @override
  State<MyCardUi> createState() => _MyCardUiState();
}

class _MyCardUiState extends State<MyCardUi> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffcddeff),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.cardName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            myDivider(24),
            widget.cardAgree == true
                ? widget.inCardWidget1!
                : const SizedBox(height: 0),
            widget.cardAgree == true
                ? widget.inCardWidget2!
                : const SizedBox(height: 0),
            widget.cardAgree == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.cardWidgets!,
                  )
                : const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
