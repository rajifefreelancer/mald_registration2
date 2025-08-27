import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class CardChildAndFamilyInfo extends StatefulWidget {
  const CardChildAndFamilyInfo({super.key});

  @override
  State<CardChildAndFamilyInfo> createState() => _CardChildAndFamilyInfoState();
}

class _CardChildAndFamilyInfoState extends State<CardChildAndFamilyInfo> {
  @override
  Widget build(BuildContext context) {
    // final dropdownListValues = Provider.of<MyDropdownListValues>(context);
    // final textEditingService = Provider.of<TextEditingService>(context);
    final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "INFORMATION ABOUT THE CHILD AND FAMILY",
      cardWidgets: [
        const Text("CHILD’S First and father’s name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.childName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Grandfather’s names:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.childGFatherName,
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
          controller: formFieldService.childCitizenship,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Sex/Gender:"),
        const SizedBox(height: 8.0),
        MyDropdownFormField(
          dropdownValue: formFieldService.gender,
          onChange: (value) {
            formFieldService.changeGender(newValue: value!);
          },
          dropdownItems: genderItems
              .map((genderItem) => DropdownMenuItem(
                    value: genderItem,
                    child: Text(genderItem),
                  ))
              .toList(),
          validate: (value) {
            if (value == null || value == "select") {
              return 'Please select a choice';
            }
            return null;
          },
          isDense: true,
        ),
        const SizedBox(height: 8.0),
        const Text("Date of birth:"),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: MyTextFormField(
                controller: formFieldService.dateOfBirth,
                enabled: false,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              minWidth: 50,
              color: Colors.blue,
              onPressed: () => dateTimeProvider.showDatePick(context),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.edit_calendar),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Text("Exact Age by August 30:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.ageOnAugust,
          enabled: false,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Family Status:"),
        const SizedBox(height: 8.0),
        MyDropdownFormField(
          dropdownValue: formFieldService.maritalStatus,
          onChange: (value) {
            formFieldService.changeMaritalStatus(newValue: value!);
            if (value != "Divorced") {
              formFieldService.divorcedName.clear();
              formFieldService.divorcedRelationship.clear();
              formFieldService.changeChildRelease(newValue: "select");
              formFieldService.changeCustodyCopies(newValue: "select");
            }
          },
          dropdownItems: maritalStatusItems
              .map((maritalStatusItem) => DropdownMenuItem(
                    value: maritalStatusItem,
                    child: Text(maritalStatusItem),
                  ))
              .toList(),
          validate: (value) {
            if (value == null || value == "select") {
              return 'Please select a choice';
            }
            return null;
          },
          isDense: true,
        ),

        // IF DIVORCED
        formFieldService.maritalStatus == "Divorced"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      "If divorced, who has legal custody?\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Name:"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.divorcedName,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text("Relationship:"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.divorcedRelationship,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text("Is the child to be released to either parent?"),
                    const SizedBox(height: 8.0),
                    MyDropdownFormField(
                      isDense: true,
                      dropdownValue: formFieldService.childRelease,
                      onChange: (value) {
                        formFieldService.changeChildRelease(newValue: value!);
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
                    const SizedBox(height: 8.0),
                    const Text(
                        "Copies of any custody agreements, court orders, and restraining orders pertaining to the child? If yes, please attach the copies"),
                    const SizedBox(height: 8.0),
                    MyDropdownFormField(
                      isDense: true,
                      dropdownValue: formFieldService.custodyCopies,
                      onChange: (value) {
                        formFieldService.changeCustodyCopies(newValue: value!);
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
                  ],
                ),
              )
            : const SizedBox(height: 0),
        const SizedBox(height: 16.0),
        const Text(
          "CONTACT DETAILS\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Family’s  Residence\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Home area commonly known as:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.childArea,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Sub-city:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.childSubCity,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("House No.:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.childHouseNo,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Emergency contact if parents/guardians are out of reach:\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Name:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.emergencyName,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Relation to the child:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.emergencyChildRelation,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Phone Number:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.emergencyPhoneNo,
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
