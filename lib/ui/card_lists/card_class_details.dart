import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:provider/provider.dart';

class CardClassDetails extends StatefulWidget {
  const CardClassDetails({super.key});

  @override
  State<CardClassDetails> createState() => _CardClassDetailsState();
}

class _CardClassDetailsState extends State<CardClassDetails> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "Class Details",
      cardWidgets: [
        Column(
          children: [
            const Text("Applying to:"),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 400,
              child: MyDropdownFormField(
                isDense: false,
                dropdownValue: formFieldService.applyTo,
                onChange: (value) {
                  formFieldService.changeApplyTo(newValue: value!);
                },
                dropdownItems: applyToItems
                    .map((applyToItem) => DropdownMenuItem(
                          value: applyToItem,
                          child: Text(applyToItem),
                        ))
                    .toList(),
                validate: (value) {
                  if (value == null || value == "select") {
                    return 'Please select a grade';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "(If the true age of the child does not match their assigned level, we reserve the rights to move the child to the appropriate class.)",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
                "Would you consider a different grade/year if initial choice was full?"),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 400,
              child: MyDropdownFormField(
                isDense: true,
                dropdownValue: formFieldService.differentGrade,
                onChange: (value) {
                  formFieldService.changeDifferentGrade(newValue: value!);
                },
                dropdownItems: yesNoItems
                    .map((yesNoItem) => DropdownMenuItem(
                          value: yesNoItem,
                          child: Text(yesNoItem),
                        ))
                    .toList(),
                validate: (value) {
                  if (value == null || value == "select") {
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
