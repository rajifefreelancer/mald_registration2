import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class CardPreviousSchoolInfo extends StatefulWidget {
  const CardPreviousSchoolInfo({super.key});

  @override
  State<CardPreviousSchoolInfo> createState() => _CardPreviousSchoolInfoState();
}

class _CardPreviousSchoolInfoState extends State<CardPreviousSchoolInfo> {
  String? testRadio = "";

  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "PREVIOUS SCHOOL INFORMATION",
      cardWidgets: [
        const Text("Has the child ever atended another school:"),
        const SizedBox(height: 8.0),
        MyDropdownFormField(
          isDense: true,
          dropdownValue: formFieldService.otherSchoolAtend,
          onChange: (value) {
            formFieldService.changeOtherSchoolAtend(newValue: value!);
            ///// for no school
            if (value != "Yes") {
              formFieldService.otherSchoolName.clear();
              formFieldService.otherSchoolAddress.clear();
              formFieldService.otherSchoolGradeLevel.clear();
              formFieldService.otherSchoolDisciplineActionYes.clear();
              formFieldService.otherSchoolHomeSchooledYes.clear();
              formFieldService.otherSchoolLanguage.clear();
              formFieldService.otherSchoolLanguageYears.clear();
              formFieldService.otherSchoolMayContactNo.clear();
              formFieldService.otherSchoolSpecialEducationYes.clear();
              formFieldService.otherSchoolWhyLeave.clear();

              formFieldService.changeOtherSchoolDisciplineAction(
                  newValue: "select");
              formFieldService.changeOtherSchoolHomeSchooled(
                  newValue: "select");
              formFieldService.changeOtherSchoolForeignLanguage(
                  newValue: "select");
              formFieldService.changeOtherSchoolMayContact(newValue: "select");
              formFieldService.changeOtherSchoolSpecialEducation(
                  newValue: "select");
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
        formFieldService.otherSchoolAtend == "Yes" //Yes
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  const Text("School Name:"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.otherSchoolName,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text("School Address:"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.otherSchoolAddress,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text("Grade Level:"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.otherSchoolGradeLevel,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),

                  // FOR PRIMARY SCHOOL
                  formFieldService.checkApplyToData == "pre"
                      ? const SizedBox(height: 0)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            const Text(
                                "Has your child ever been suspended, expelled or subject to serious discipline by a school as a result of his/her behavior or academic performance?"),
                            const SizedBox(height: 8.0),
                            MyDropdownFormField(
                              isDense: true,
                              dropdownValue:
                                  formFieldService.otherSchoolDisciplineAction,
                              onChange: (value) {
                                formFieldService
                                    .changeOtherSchoolDisciplineAction(
                                        newValue: value!);
                                if (value != "Yes") {
                                  formFieldService
                                      .otherSchoolDisciplineActionYes
                                      .clear();
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
                            formFieldService.otherSchoolDisciplineAction ==
                                    "Yes"
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        const Text(" ^ If Yes, please specify"),
                                        const SizedBox(height: 8.0),
                                        MyTextFormField(
                                          controller: formFieldService
                                              .otherSchoolDisciplineActionYes,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ))
                                : const SizedBox(height: 0),
                            const SizedBox(height: 8.0),
                            const Text(
                                "Has your child ever been home-schooled?"),
                            const SizedBox(height: 8.0),
                            MyDropdownFormField(
                              isDense: true,
                              dropdownValue:
                                  formFieldService.otherSchoolHomeSchooled,
                              onChange: (value) {
                                formFieldService.changeOtherSchoolHomeSchooled(
                                    newValue: value!);
                                if (value != "Yes") {
                                  formFieldService.otherSchoolHomeSchooledYes
                                      .clear();
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
                            formFieldService.otherSchoolHomeSchooled == "Yes"
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        const Text(" ^ If Yes, please specify"),
                                        const SizedBox(height: 8.0),
                                        MyTextFormField(
                                          controller: formFieldService
                                              .otherSchoolHomeSchooledYes,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ))
                                : const SizedBox(height: 0),
                          ],
                        ),

                  const SizedBox(height: 8.0),
                  const Text(
                      "Has the child been studying any foreign language at school?"),
                  const SizedBox(height: 8.0),
                  MyDropdownFormField(
                    isDense: true,
                    dropdownValue: formFieldService.otherSchoolForeignLanguage,
                    onChange: (value) {
                      formFieldService.changeOtherSchoolForeignLanguage(
                          newValue: value!);
                      if (value != "Yes") {
                        formFieldService.otherSchoolLanguage.clear();
                        formFieldService.otherSchoolLanguageYears.clear();
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
                  formFieldService.otherSchoolForeignLanguage == "Yes"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8.0),
                                const Text("Language:"),
                                const SizedBox(height: 8.0),
                                MyTextFormField(
                                  controller:
                                      formFieldService.otherSchoolLanguage,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                const Text("How many years:"),
                                const SizedBox(height: 8.0),
                                MyTextFormField(
                                  controller:
                                      formFieldService.otherSchoolLanguageYears,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is empty';
                                    }
                                    return null;
                                  },
                                ),
                              ]),
                        )
                      : const SizedBox(height: 0),

                  /////////////////////////////////////////////////
                  const SizedBox(height: 8.0),
                  const Text("May we contact the school?"),
                  const SizedBox(height: 8.0),
                  MyDropdownFormField(
                    isDense: true,
                    dropdownValue: formFieldService.otherSchoolMayContact,
                    onChange: (value) {
                      formFieldService.changeOtherSchoolMayContact(
                          newValue: value!);
                      if (value != "No") {
                        formFieldService.otherSchoolMayContactNo.clear();
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
                  // IF NO
                  formFieldService.otherSchoolMayContact == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              const Text(" ^ If NO, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.otherSchoolMayContactNo,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ))
                      : const SizedBox(height: 0),
                  /////////////////////////////////////////////
                  const SizedBox(height: 8.0),
                  const Text(
                      "Has the child ever been enrolled in any type of Special Education program (e.g. gifted and talented program, learning difference/disability, speech therapy or had a one-on-one teacher)?"),
                  const SizedBox(height: 8.0),
                  MyDropdownFormField(
                    isDense: true,
                    dropdownValue: formFieldService.otherSchoolSpecialEducation,
                    onChange: (value) {
                      formFieldService.changeOtherSchoolSpecialEducation(
                          newValue: value!);
                      if (value != "Yes") {
                        formFieldService.otherSchoolSpecialEducationYes.clear();
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
                  formFieldService.otherSchoolSpecialEducation == "Yes"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              const Text(" ^ If Yes, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller: formFieldService
                                    .otherSchoolSpecialEducationYes,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ))
                      : const SizedBox(height: 0),
                  const SizedBox(height: 8.0),
                  const Text(
                      "Why did your child leave the school? please specify"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.otherSchoolWhyLeave,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                ],
              )
            : const SizedBox(height: 0),
      ],
    );
  }
}
