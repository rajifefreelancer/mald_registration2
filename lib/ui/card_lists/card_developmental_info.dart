import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_dropdown_form_field.dart';
import 'package:mald_registration_app02/widgets/my_radio_list_custom_widget.dart';
import 'package:mald_registration_app02/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class CardDevelopmentalInfo extends StatefulWidget {
  const CardDevelopmentalInfo({super.key});

  @override
  State<CardDevelopmentalInfo> createState() => _CardDevelopmentalInfoState();
}

class _CardDevelopmentalInfoState extends State<CardDevelopmentalInfo> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    return MyCardUi(
      cardAgree: false,
      cardName: "DEVELOPMENTAL INFORMATION",
      cardWidgets: [
        const SizedBox(height: 8.0),
        const Text(
          "N.B. MALD is not a therapy center and hence, if your child has any developmental delays, your child will be required to pass through a formal assessment that should be done by the MALD suggested assessment center. We only give the opportunity on the first- come first -served basis for few children with special needs as there is limited space in a class.",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),

        // EMOTIONAL
        const SizedBox(height: 16.0),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title:
              Text("Emotional", style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        MyRadioCustom(
          radioTitle: const Text("Does your child regulate emotions?"),
          radioSubTitle: formFieldService.devRegulateEmotions == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devRegulateEmotions,
          onChange: (value) {
            formFieldService.changeDevRegulateEmotions(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text("Does your child show concern for others?"),
          radioSubTitle: formFieldService.devConcernForOthers == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devConcernForOthers,
          onChange: (value) {
            formFieldService.changeDevConcernForOthers(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text(
              "Is your child willing to share with others and takes turns?"),
          radioSubTitle: formFieldService.devShareWithOthers == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devShareWithOthers,
          onChange: (value) {
            formFieldService.changeDevShareWithOthers(newValue: value!);
            if (value == "Yes") {
              formFieldService.devShareWithOthersNo.clear();
            }
          },
        ),
        // IF NO
        formFieldService.devShareWithOthers == "No"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 8.0),
                    const Text(" ^ If No, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devShareWithOthersNo,
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
        MyRadioCustom(
          radioTitle:
              const Text("Is your child willing to participate in a group?"),
          radioSubTitle: formFieldService.devParticipateInAGroup == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devParticipateInAGroup,
          onChange: (value) {
            formFieldService.changeDevParticipateInAGroup(newValue: value!);
            if (value == "Yes") {
              formFieldService.devParticipateInAGroupNo.clear();
            }
          },
        ),
        // IF NO
        formFieldService.devParticipateInAGroup == "No"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 8.0),
                    const Text(" ^ If No, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devParticipateInAGroupNo,
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

        // FOR PRE SCHOOL ////
        formFieldService.checkApplyToData == "other" // other pre
            ? const SizedBox(height: 0)
            : Column(
                children: [
                  MyRadioCustom(
                    radioTitle:
                        const Text("Is your child emotionally matured?"),
                    radioSubTitle: formFieldService.devEmotionallyMatured == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devEmotionallyMatured,
                    onChange: (value) {
                      formFieldService.changeDevEmotionallyMatured(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle:
                        const Text("Does your child relate with peers?"),
                    radioSubTitle: formFieldService.devRelateWithPeers == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devRelateWithPeers,
                    onChange: (value) {
                      formFieldService.changeDevRelateWithPeers(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Does your child have relationship with adults?"),
                    radioSubTitle: formFieldService.devRelationshipWithAdults ==
                            ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devRelationshipWithAdults,
                    onChange: (value) {
                      formFieldService.changeDevRelationshipWithAdults(
                          newValue: value!);
                    },
                  ),
                ],
              ),

        // LEARNING CAPACITY
        const SizedBox(height: 16.0),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Learning Capacity",
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        MyRadioCustom(
          radioTitle: const Text("Is your child curious?"),
          radioSubTitle: formFieldService.devIsCurious == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devIsCurious,
          onChange: (value) {
            formFieldService.changeDevIsCurious(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text("Does your child persevere?"),
          radioSubTitle: formFieldService.devPersevere == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devPersevere,
          onChange: (value) {
            formFieldService.changeDevPersevere(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text("Does your child work independently?"),
          radioSubTitle: formFieldService.devWorkIndependently == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devWorkIndependently,
          onChange: (value) {
            formFieldService.changeDevWorkIndependently(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text("Can your child focus on one task at a time?"),
          radioSubTitle: formFieldService.devFocusOnOneTask == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devFocusOnOneTask,
          onChange: (value) {
            formFieldService.changeDevFocusOnOneTask(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle: const Text(
              "Does your child have the ability to communicate ideas?"),
          radioSubTitle: formFieldService.devCommunicateIdeas == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devCommunicateIdeas,
          onChange: (value) {
            formFieldService.changeDevCommunicateIdeas(newValue: value!);
          },
        ),
        MyRadioCustom(
          radioTitle:
              const Text("Does your child have critical thinking skills?"),
          radioSubTitle: formFieldService.devCriticalThinking == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devCriticalThinking,
          onChange: (value) {
            formFieldService.changeDevCriticalThinking(newValue: value!);
          },
        ),

        // PHYSICAL/SELF HELP
        // FOR PRI SCHOOL
        formFieldService.checkApplyToData == "other" // other pre
            ? const SizedBox(height: 0)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Physical/Self Help",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              "No",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyRadioCustom(
                    radioTitle: const Text("Is your child toilet-trained?"),
                    radioSubTitle: formFieldService.devToiletTrained == ""
                        ? const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "^ Child is not toilet trained if he/she uses diapers in the daytime."),
                              Text("Please choose one option",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12)),
                            ],
                          )
                        : const Text(
                            "^ Child is not toilet trained if he/she uses diapers in the daytime."),
                    radioGroupValue: formFieldService.devToiletTrained,
                    onChange: (value) {
                      formFieldService.changeDevToiletTrained(newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text("Can your child dress him/herself?"),
                    radioSubTitle: formFieldService.devDressThemselves == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devDressThemselves,
                    onChange: (value) {
                      formFieldService.changeDevDressThemselves(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text("Can your child feed him/herself?"),
                    radioSubTitle: formFieldService.devFeedThemselves == ""
                        ? const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "^ We expect a child to feed himself/herself in a given time."),
                              Text("Please choose one option",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12)),
                            ],
                          )
                        : const Text(
                            "^ We expect a child to feed himself/herself in a given time."),
                    radioGroupValue: formFieldService.devFeedThemselves,
                    onChange: (value) {
                      formFieldService.changeDevFeedThemselves(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle:
                        const Text("Can your child wash hands by him/herself?"),
                    radioSubTitle: formFieldService.devWashHandsByThemselves ==
                            ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devWashHandsByThemselves,
                    onChange: (value) {
                      formFieldService.changeDevWashHandsByThemselves(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Does your child play 'Pretend' dress up or play act?"),
                    radioSubTitle: formFieldService.devPlayPretend == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devPlayPretend,
                    onChange: (value) {
                      formFieldService.changeDevPlayPretend(newValue: value!);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16.0),
                        const ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                              "Does your child know any of the following about himself/herself?",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyRadioCustom(
                          radioTitle: const Text("His/her name?"),
                          radioSubTitle: formFieldService.devKnowTheirName == ""
                              ? const Text("Please choose one option",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                              : null,
                          radioGroupValue: formFieldService.devKnowTheirName,
                          onChange: (value) {
                            formFieldService.changeDevKnowTheirName(
                                newValue: value!);
                          },
                        ),
                        MyRadioCustom(
                          radioTitle: const Text("Father's name?"),
                          radioSubTitle:
                              formFieldService.devKnowFatherName == ""
                                  ? const Text("Please choose one option",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12))
                                  : null,
                          radioGroupValue: formFieldService.devKnowFatherName,
                          onChange: (value) {
                            formFieldService.changeDdevKnowFatherName(
                                newValue: value!);
                          },
                        ),
                        MyRadioCustom(
                          radioTitle: const Text("Mother's name?"),
                          radioSubTitle:
                              formFieldService.devKnowMotherName == ""
                                  ? const Text("Please choose one option",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12))
                                  : null,
                          radioGroupValue: formFieldService.devKnowMotherName,
                          onChange: (value) {
                            formFieldService.changeDdevKnowMotherName(
                                newValue: value!);
                          },
                        ),
                        MyRadioCustom(
                          radioTitle: const Text("Gender?"),
                          radioSubTitle: formFieldService.devKnowGender == ""
                              ? const Text("Please choose one option",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                              : null,
                          radioGroupValue: formFieldService.devKnowGender,
                          onChange: (value) {
                            formFieldService.changeDevKnowGender(
                                newValue: value!);
                          },
                        ),
                        MyRadioCustom(
                          radioTitle: const Text("Age?"),
                          radioSubTitle: formFieldService.devKnowAge == ""
                              ? const Text("Please choose one option",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                              : null,
                          radioGroupValue: formFieldService.devKnowAge,
                          onChange: (value) {
                            formFieldService.changeDevKnowAge(newValue: value!);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24.0),
                        const Text(
                          "As far as you know/remember at what age did your child first: (Write 'NA' if you don't remember)\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text("Sit alone:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devSitAlone,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Walk alone:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devWalkAlone,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Say single words:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devSaySingleWords,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Speak sentences:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devSpeakSentences,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Hold own cup:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devHoldOwnCup,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Feed self with spoon:"),
                        const SizedBox(height: 8.0),
                        MyTextFormField(
                          controller: formFieldService.devFeedSelfWithSpoon,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is empty';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

        // SPEECH AND COMMUNICATION
        const SizedBox(height: 24.0),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Speech and Communication",
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        MyRadioCustom(
          radioTitle:
              const Text("Does your child have a very short attention span?"),
          radioSubTitle: formFieldService.devShortAttentionSpan == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devShortAttentionSpan,
          onChange: (value) {
            formFieldService.changeDevShortAttentionSpan(newValue: value!);
            if (value == "No") {
              formFieldService.devShortAttentionSpanYes.clear();
            }
          },
        ),
        // IF YES
        formFieldService.devShortAttentionSpan == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 8.0),
                    const Text(" ^ If Yes, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devShortAttentionSpanYes,
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

        // FOR PRIMARY SCHOOL
        formFieldService.checkApplyToData == "pre" // other pre
            ? const SizedBox(height: 0)
            : Column(
                children: [
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Is your child able to speak in their primary language?"),
                    radioSubTitle: formFieldService.devSpeakPrimaryLanguage ==
                            ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devSpeakPrimaryLanguage,
                    onChange: (value) {
                      formFieldService.changeDevSpeakPrimaryLanguage(
                          newValue: value!);
                      if (value == "Yes") {
                        formFieldService.devSpeakPrimaryLanguageNo.clear();
                      }
                    },
                  ),
                  // IF NO
                  formFieldService.devSpeakPrimaryLanguage == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If No, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devSpeakPrimaryLanguageNo,
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
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Is your child afraid to speak in front of the public?"),
                    radioSubTitle: formFieldService.devAfraidSpeakPublic == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devAfraidSpeakPublic,
                    onChange: (value) {
                      formFieldService.changeDevAfraidSpeakPublic(
                          newValue: value!);
                    },
                  ),
                ],
              ),

        // FOR PRE SCHOOL ////
        formFieldService.checkApplyToData == "other" // other pre
            ? const SizedBox(height: 0)
            : Column(
                children: [
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Is your child able to speak most sounds correctly in their primary language?"),
                    radioSubTitle:
                        formFieldService.devSpeakSoundsPrimaryLanguage == ""
                            ? const Text("Please choose one option",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12))
                            : null,
                    radioGroupValue:
                        formFieldService.devSpeakSoundsPrimaryLanguage,
                    onChange: (value) {
                      formFieldService.changeDevSpeakSoundsPrimaryLanguage(
                          newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text("Is your child afraid to speak?"),
                    radioSubTitle: formFieldService.devAfraidToSpeak == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devAfraidToSpeak,
                    onChange: (value) {
                      formFieldService.changeDevAfraidToSpeak(newValue: value!);
                    },
                  ),
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Does your child make eye contact when you speak to them?"),
                    radioSubTitle: formFieldService.devEyeContactSpeak == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devEyeContactSpeak,
                    onChange: (value) {
                      formFieldService.changeDevEyeContactSpeak(
                          newValue: value!);
                      if (value == "Yes") {
                        formFieldService.devEyeContactSpeakNo.clear();
                      }
                    },
                  ),
                  // IF NO
                  formFieldService.devEyeContactSpeak == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If No, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devEyeContactSpeakNo,
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
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Does your child usually follow directions?"),
                    radioSubTitle: formFieldService.devFollowDirections == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devFollowDirections,
                    onChange: (value) {
                      formFieldService.changeDevFollowDirections(
                          newValue: value!);
                      if (value == "Yes") {
                        formFieldService.devFollowDirectionsNo.clear();
                      }
                    },
                  ),
                  // IF NO
                  formFieldService.devFollowDirections == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If No, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devFollowDirectionsNo,
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
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Can your child follow 2 or 3 different sequential instructions?"),
                    radioSubTitle: formFieldService.devDifferentInstructions ==
                            ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devDifferentInstructions,
                    onChange: (value) {
                      formFieldService.changeDevDifferentInstructions(
                          newValue: value!);
                      if (value == "Yes") {
                        formFieldService.devDifferentInstructionsNo.clear();
                      }
                    },
                  ),
                  // IF NO
                  formFieldService.devDifferentInstructions == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If No, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devDifferentInstructionsNo,
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
                  MyRadioCustom(
                    radioTitle: const Text(
                        "can other people or a person unfamiliar with his/her speech understand most of what the child say?"),
                    radioSubTitle: formFieldService.devSpeechUnderstandable ==
                            ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devSpeechUnderstandable,
                    onChange: (value) {
                      formFieldService.changeDevSpeechUnderstandable(
                          newValue: value!);
                      if (value == "Yes") {
                        formFieldService.devSpeechUnderstandableNo.clear();
                      }
                    },
                  ),
                  // IF NO
                  formFieldService.devSpeechUnderstandable == "No"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(" ^ If No, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devSpeechUnderstandableNo,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24.0),
                        const Text(
                          "How does the child communicate his or her wants and needs?(Select all that apply)\n(Yes) (Sometimes) (Not yet) (No)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text("The child does not make requests"),
                        const SizedBox(height: 8.0),
                        MyDropdownFormField(
                          isDense: true,
                          dropdownValue: formFieldService.devComNoRequests,
                          onChange: (value) {
                            formFieldService.changeDevComNoRequests(
                                newValue: value!);
                          },
                          dropdownItems: yesSometimesNoItems
                              .map((yesSometimesNoItem) => DropdownMenuItem(
                                    value: yesSometimesNoItem,
                                    child: Text(yesSometimesNoItem),
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
                            "Non-verbally with pictures, gestures, signs"),
                        const SizedBox(height: 8.0),
                        MyDropdownFormField(
                          isDense: true,
                          dropdownValue: formFieldService.devComNonVerbally,
                          onChange: (value) {
                            formFieldService.changeDevComNonVerbally(
                                newValue: value!);
                          },
                          dropdownItems: yesSometimesNoItems
                              .map((yesSometimesNoItem) => DropdownMenuItem(
                                    value: yesSometimesNoItem,
                                    child: Text(yesSometimesNoItem),
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
                        const Text("Verbally with sounds or crying"),
                        const SizedBox(height: 8.0),
                        MyDropdownFormField(
                          isDense: true,
                          dropdownValue: formFieldService.devComVerballySounds,
                          onChange: (value) {
                            formFieldService.changeDevComVerballySounds(
                                newValue: value!);
                          },
                          dropdownItems: yesSometimesNoItems
                              .map((yesSometimesNoItem) => DropdownMenuItem(
                                    value: yesSometimesNoItem,
                                    child: Text(yesSometimesNoItem),
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
                            "Verbally with single words or short phrases"),
                        const SizedBox(height: 8.0),
                        MyDropdownFormField(
                          isDense: true,
                          dropdownValue:
                              formFieldService.devComVerballySingleWords,
                          onChange: (value) {
                            formFieldService.changeDevComVerballySingleWords(
                                newValue: value!);
                          },
                          dropdownItems: yesSometimesNoItems
                              .map((yesSometimesNoItem) => DropdownMenuItem(
                                    value: yesSometimesNoItem,
                                    child: Text(yesSometimesNoItem),
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
                        const Text("Using complete sentences"),
                        const SizedBox(height: 8.0),
                        MyDropdownFormField(
                          isDense: true,
                          dropdownValue:
                              formFieldService.devComCompleteSentences,
                          onChange: (value) {
                            formFieldService.changeDevComCompleteSentences(
                                newValue: value!);
                          },
                          dropdownItems: yesSometimesNoItems
                              .map((yesSometimesNoItem) => DropdownMenuItem(
                                    value: yesSometimesNoItem,
                                    child: Text(yesSometimesNoItem),
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
                  ),
                ],
              ),

        // PHYSICAL/EMOTIONAL/MEDICAL CONDITION
        const SizedBox(height: 24.0),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Physical, Emotional or Medical Condition",
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        MyRadioCustom(
          radioTitle: const Text(
              "Does your child require any physical or emotional support as part of his or her learning program (e.g. mobility issues, allergies, recent family changes or personal difficulties)?"),
          radioSubTitle: formFieldService.devMedRequireSupport == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devMedRequireSupport,
          onChange: (value) {
            formFieldService.changeDevMedRequireSupport(newValue: value!);
            if (value == "No") {
              formFieldService.devMedRequireSupportYes.clear();
            }
          },
        ),
        // IF YES
        formFieldService.devMedRequireSupport == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" ^ If Yes, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devMedRequireSupportYes,
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
        MyRadioCustom(
          radioTitle: const Text(
              "Does your child have any dietary restrictions (vegetarian, vegan, gluten free, etc.) or has allergies (dogs, cats, medication, plants, scents, etc.)"),
          radioSubTitle: formFieldService.devMedDietaryRestrictions == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devMedDietaryRestrictions,
          onChange: (value) {
            formFieldService.changeDevMedDietaryRestrictions(newValue: value!);
            if (value == "No") {
              formFieldService.devMedDietaryRestrictionsYes.clear();
            }
          },
        ),
        // IF YES
        formFieldService.devMedDietaryRestrictions == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" ^ If Yes, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devMedDietaryRestrictionsYes,
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
        MyRadioCustom(
          radioTitle: const Text(
              "Does your child have a diagnosed medical condition that may require support?"),
          radioSubTitle: formFieldService.devMedDiagnosedSupport == ""
              ? const Text("Please choose one option",
                  style: TextStyle(color: Colors.red, fontSize: 12))
              : null,
          radioGroupValue: formFieldService.devMedDiagnosedSupport,
          onChange: (value) {
            formFieldService.changeDevMedDiagnosedSupport(newValue: value!);
            if (value == "No") {
              formFieldService.devMedDiagnosedSupportYes.clear();
            }
          },
        ),
        // IF YES
        formFieldService.devMedDiagnosedSupport == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" ^ If Yes, please specify"),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: formFieldService.devMedDiagnosedSupportYes,
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

        // FOR PRIMARY SCHOOL
        formFieldService.checkApplyToData == "pre" // other pre
            ? const SizedBox(height: 0)
            : Column(
                children: [
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Has your child ever been referred to an educational psychologist?"),
                    radioSubTitle:
                        formFieldService.devMedReferredEduPsychologist == ""
                            ? const Text("Please choose one option",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12))
                            : null,
                    radioGroupValue:
                        formFieldService.devMedReferredEduPsychologist,
                    onChange: (value) {
                      formFieldService.changeDevMedReferredEduPsychologist(
                          newValue: value!);
                      if (value == "No") {
                        formFieldService.devMedReferredEduPsychologistYes
                            .clear();
                      }
                    },
                  ),
                  // IF YES
                  formFieldService.devMedReferredEduPsychologist == "Yes"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If Yes, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller: formFieldService
                                    .devMedReferredEduPsychologistYes,
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
                  MyRadioCustom(
                    radioTitle: const Text(
                        "Has your child ever been diagnosed as having Attention Deficit Disorder?"),
                    radioSubTitle: formFieldService.devMedAttentionDeficit == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                    radioGroupValue: formFieldService.devMedAttentionDeficit,
                    onChange: (value) {
                      formFieldService.changeDevMedAttentionDeficit(
                          newValue: value!);
                      if (value == "No") {
                        formFieldService.devMedAttentionDeficitYes.clear();
                      }
                    },
                  ),
                  // IF YES
                  formFieldService.devMedAttentionDeficit == "Yes"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 8.0),
                              const Text(" ^ If Yes, please specify"),
                              const SizedBox(height: 8.0),
                              MyTextFormField(
                                controller:
                                    formFieldService.devMedAttentionDeficitYes,
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
                ],
              ),

        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                    "Has your child ever been diagnosed or has history with any delay or difficulty:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "No",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MyRadioCustom(
                radioTitle: const Text("Learning"),
                radioSubTitle: formFieldService.devMedDiagnosedLearning == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedLearning,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedLearning(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedLearningYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedLearning == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedLearningYes,
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
              MyRadioCustom(
                radioTitle: const Text("Physical"),
                radioSubTitle: formFieldService.devMedDiagnosedPhysical == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedPhysical,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedPhysical(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedPhysicalYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedPhysical == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedPhysicalYes,
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
              MyRadioCustom(
                radioTitle: const Text("behavioral issues"),
                radioSubTitle: formFieldService.devMedDiagnosedBehavioral == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedBehavioral,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedBehavioral(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedBehavioralYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedBehavioral == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedBehavioralYes,
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
              MyRadioCustom(
                radioTitle: const Text("Emotional"),
                radioSubTitle: formFieldService.devMedDiagnosedEmotional == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedEmotional,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedEmotional(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedEmotionalYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedEmotional == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedEmotionalYes,
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
              MyRadioCustom(
                radioTitle: const Text("Speech problem or Delay"),
                radioSubTitle: formFieldService.devMedDiagnosedSpeech == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedSpeech,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedSpeech(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedSpeechYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedSpeech == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedSpeechYes,
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
              MyRadioCustom(
                radioTitle: const Text("Social"),
                radioSubTitle: formFieldService.devMedDiagnosedSocial == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedSocial,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedSocial(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedSocialYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedSocial == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedSocialYes,
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
              MyRadioCustom(
                radioTitle: const Text("Vision deficit"),
                radioSubTitle: formFieldService.devMedDiagnosedVision == ""
                    ? const Text("Please choose one option",
                        style: TextStyle(color: Colors.red, fontSize: 12))
                    : null,
                radioGroupValue: formFieldService.devMedDiagnosedVision,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedVision(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedVisionYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedVision == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller:
                                formFieldService.devMedDiagnosedVisionYes,
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
              MyRadioCustom(
                radioTitle: const Text("Seizures/Epilepsy"),
                radioSubTitle:
                    formFieldService.devMedDiagnosedSeizuresEpilepsy == ""
                        ? const Text("Please choose one option",
                            style: TextStyle(color: Colors.red, fontSize: 12))
                        : null,
                radioGroupValue:
                    formFieldService.devMedDiagnosedSeizuresEpilepsy,
                onChange: (value) {
                  formFieldService.changeDevMedDiagnosedSeizuresEpilepsy(
                      newValue: value!);
                  if (value == "No") {
                    formFieldService.devMedDiagnosedSeizuresEpilepsyYes.clear();
                  }
                },
              ),
              // IF YES
              formFieldService.devMedDiagnosedSeizuresEpilepsy == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 8.0),
                          const Text(" ^ If Yes, please specify"),
                          const SizedBox(height: 8.0),
                          MyTextFormField(
                            controller: formFieldService
                                .devMedDiagnosedSeizuresEpilepsyYes,
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
                  "Any other disability: (Write 'Nun' if no other disability)"),
              const SizedBox(height: 8.0),
              MyTextFormField(
                controller: formFieldService.devMedDiagnosedOther,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is empty';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),

        // DESCRIBE YOUR CHILD
        const SizedBox(height: 32.0),
        const Text(
          "Describe your child (temperament, personality, interest, abilities):\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        // FOR PRIMARY SCHOOL
        formFieldService.checkApplyToData == "pre" // other pre
            ? const SizedBox(height: 0)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("What is your child's most favorite subject?"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.devMostFavoriteSubject,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text("What is your child's least favorite subject?"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.devLeastFavoriteSubject,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),

        // FOR PRE SCHOOL
        formFieldService.checkApplyToData == "other" // other pre
            ? const SizedBox(height: 0)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  const Text(
                      "Describe your child's favorite toys or activities:"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.devFavoriteToys,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text("Describe any activities your child avoids:"),
                  const SizedBox(height: 8.0),
                  MyTextFormField(
                    controller: formFieldService.devActivityAvoids,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
        const SizedBox(height: 8.0),
        const Text(
            "Does your child have any special talents or interest in any field?"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.devSpecialTalents,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text(
            "Describe any afterschool activities your child like to participate:"),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.devAfterschoolActivity,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        const Text("Use three words to describe your child."),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.devDescribeChild,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 32.0),
        const Text(
          "MALD Primary School believes in the holistic development of each student and that there is more success when families are actively engaged in the learning process.\n",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Text(
            "Give examples of the ways you will support your child's learning."),
        const SizedBox(height: 8.0),
        MyTextFormField(
          controller: formFieldService.devExampleSupport,
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
