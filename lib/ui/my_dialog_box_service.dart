import 'package:flutter/material.dart';

class MyDialogBoxService extends ChangeNotifier {
  void openDialogBox(BuildContext context, Widget? widgetContent) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: 750,
            height: double.maxFinite,
            child: widgetContent,
          ),
        );
      },
    );
    notifyListeners();
  }
}
