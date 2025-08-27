import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/card_lists/card_school_fee_table.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:provider/provider.dart';

class CardSchoolFee extends StatefulWidget {
  const CardSchoolFee({super.key});

  @override
  State<CardSchoolFee> createState() => _CardSchoolFeeState();
}

class _CardSchoolFeeState extends State<CardSchoolFee> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "SCHOOL FEE",
      cardWidgets: [
        const SizedBox(height: 8.0),
        const Text(
          "MALD Primary School established the tuition and fee schedule set only for the school year 2024-2025. All are in Ethiopian Birr.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
            "If you prefer to settle school fees annually there will be a 5% discount."),
        const SizedBox(height: 8.0),
        MyDropdownFormField(
          isDense: true,
          dropdownValue: formFieldService.feeSettleAnnually,
          onChange: (value) {
            formFieldService.changeFeeSettleAnnually(newValue: value!);
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
        ///////////// FOR THE PRICE TABLE ///////////////
        const SizedBox(height: 16.0),
        const CardSchoolFeeTable(),
        /////////////////////////////////////////////
        const SizedBox(height: 16.0),
        const Text(
          "N .B For registration to be complete, the capital levy and the first term fee should be paid (i.e. ETB 74,667 for Non-Siblings and ETB 54,667 for siblings). We are using Dashen Bank School System; once your registration is complete all payment will be transferred to the new system from the second trimester on. But the first payment should be made via the below stated account.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Please transfer the money to our account at DASHEN BANK 0063784698001- under your child’s name.   Please don’t use names other than your child’s name as we have difficulties to trace back whose payment is done. Payment is complete when deposit slip is submitted to the office in 5 working days so that we can issue you a receipt accordingly.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          "The payment should be made after 5 days of the interview.   If you fail to do so, we are not forced to keep the spot for your child. Thank you.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
