import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class CardMoreDetails extends StatefulWidget {
  const CardMoreDetails({super.key});

  @override
  State<CardMoreDetails> createState() => _CardMoreDetailsState();
}

class _CardMoreDetailsState extends State<CardMoreDetails> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "MORE DETAILS",
      cardWidgets: [
        const SizedBox(height: 8.0),
        const Text(
          "More Details\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Please indicate where you found out about our school:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.detailsWhereFoundSchool,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text(
            "What reasons have determined your choice of MALD Primary School?:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.detailsWhyChooseSchool,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text(
            "What do you hope that you and your child will gain from MALD Primary School?:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.detailsHopeToGainInSchool,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        const Text(
          "NOTE: Before the school payment is settled, we will have an interview with both parents/guardians (if both cannot make it, one should be available) and a team of teachers in the school will observe the child and conduct the assessment. The assessment fee is ETB 3,000 for all levels. After the interview and the assessment is completed, the school will notify you parents through telephone if your child is eligible for admission and you will be required to fill out this form and return it with the supporting documents to the office in 3 days. Then payment should be made in 5 days after the acceptance call from the Office. If you fail to do so, we are not forced to keep the spot for your child. Thank you.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
