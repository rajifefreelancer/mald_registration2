import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class CardFamilyData extends StatefulWidget {
  const CardFamilyData({super.key});

  @override
  State<CardFamilyData> createState() => _CardFamilyDataState();
}

class _CardFamilyDataState extends State<CardFamilyData> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "FAMILY DATA",
      cardWidgets: [
        const SizedBox(height: 8.0),
        const Text(
          "Father's Details\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("First Name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherFirstName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Father’s Name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherFatherName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Citizenship:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherCitizenship,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Father's employer/name of the company:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherEmployer,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Father's job title:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherJobTitle,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("E-mail address:"), // (please print in block letters)
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherEmail,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Mobile telephone:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherMobileTel,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Work Telephone  (for emergency only):"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.fatherWorkTel,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Mother's Details\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("First Name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherFirstName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Father’s Name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherFatherName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Citizenship:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherCitizenship,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Mother’s employer/name of the company:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherEmployer,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Mother’s job title:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherJobTitle,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("E-mail address:"), // (please print in block letters)
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherEmail,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Mobile telephone:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherMobileTel,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Work Telephone  (for emergency only):"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.motherWorkTel,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Siblings/Step Siblings\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Age of other children in the family: (If nun write 0)"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.siblingsAge,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text(
          "Other Family Informations\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
            "Are there others who take care of your child on a regular basis?"),
        const SizedBox(height: 8.0),
        MyDropdownFormField(
          isDense: true,
          dropdownValue: formFieldService.familyOthersWhoTakeCare,
          onChange: (value) {
            formFieldService.changeFamilyOthersWhoTakeCare(newValue: value!);
            if (value != "Yes") {
              formFieldService.familyOtherCareName.clear();
              formFieldService.familyCareHowOften.clear();
            }
          },
          dropdownItems: yesNoItems
              .map((yesNoItem) => DropdownMenuItem(
                    value: yesNoItem,
                    child: Text(yesNoItem),
                  ))
              .toList(),
          validate: (value) {
            if (value == null || value == "select") {
              return 'Please select a choice';
            }
            return null;
          },
        ),
        // IF YES
        formFieldService.familyOthersWhoTakeCare == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text("Name:"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.familyOtherCareName,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text("How often?"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.familyCareHowOften,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is empty';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 0),
        const SizedBox(height: 16.0),
        const Text(
            "Language(s) regularly spoken at home: (use ',' if more than one)"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.familyRegularlySpoken,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text(
            "In what language does your child read at home? (use ',' if more than one)"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.familyReadingLanguage,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}
