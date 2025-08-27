import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mald_registration_app02/pages/parental_agrement_page.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/services/firebase_crud.dart';
import 'package:mald_registration_app02/ui/card_lists/card_child_and_family_info.dart';
import 'package:mald_registration_app02/ui/card_lists/card_class_details.dart';
import 'package:mald_registration_app02/ui/card_lists/card_developmental_info.dart';
import 'package:mald_registration_app02/ui/card_lists/card_family_data.dart';
import 'package:mald_registration_app02/ui/card_lists/card_more_details.dart';
import 'package:mald_registration_app02/ui/card_lists/card_previous_school_info.dart';
import 'package:mald_registration_app02/ui/card_lists/card_school_fee.dart';
import 'package:mald_registration_app02/ui/my_dialog_box_service.dart';
import 'package:mald_registration_app02/widgets/my_button_widget.dart';
import 'package:mald_registration_app02/widgets/my_divider_widget.dart';
import 'package:provider/provider.dart';
////////////////////////////

Future<bool> showSaveConfirmationDialog(BuildContext context) async {
  final agree = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      titlePadding: const EdgeInsets.all(6.0),
      contentPadding: const EdgeInsets.all(6.0),
      title: const Center(
          child: Text(
        'READ EVERYTHING BEFORE AGREEING',
        textAlign: TextAlign.center,
      )),
      titleTextStyle: const TextStyle(fontSize: 12),
      content: const SizedBox(
        width: 750,
        child:
            ParentalAgreementPage(), //Text('Are you sure you want to save the data?')
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true), // Agree
          child: const Text('Agree'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false), // Disagree
          child: const Text('Disagree'),
        ),
      ],
    ),
  );
  return agree ?? false; // Handle potential null result
}
//////////////////////

class RegistrationFormPage extends StatefulWidget {
  final String? documentID;
  const RegistrationFormPage({
    super.key,
    this.documentID,
  });

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  //////////////////////////

  bool _isSaving = false; // Track saving state

  Future<void> saveDataWithConfirmation(
      BuildContext context, String? docID) async {
    final fFs = Provider.of<FormFieldService>(context, listen: false);
    final isValid = _formKey.currentState?.validate();
    fFs.formFieldServiceValidate();

    setState(() {
      _isSaving = true; // Disable save button and show progress
    });
    if (isValid != null &&
        isValid &&
        fFs.formIsValid == "valid" &&
        docID == null &&
        fFs.isEditing == false) {
      final agree = await showSaveConfirmationDialog(context);
      if (agree) {
        // Perform actual data saving logic here (replace with your logic)
        //await Future.delayed(const Duration(seconds: 2)); // Simulate saving

        if (mounted) {
          await _saveData(context: context, docID: widget.documentID);
          //Navigator.pop(context);
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Data saved successfully!'),
            ),
          );
        }
      } else {
        setState(() {
          _isSaving = false; // Re-enable save button on disagree
        });
      }
    } else if (isValid != null &&
        isValid &&
        fFs.formIsValid == "valid" &&
        docID != null &&
        fFs.isEditing == true) {
      await _saveData(context: context, docID: widget.documentID);
      //Navigator.pop(context);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data updated successfully!'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid data'),
        ),
      );
    }

    setState(() {
      _isSaving = false; // Re-enable save button
    });
  }

  //////////////////////////
  ///
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isProcessing = false;

  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  Future<void> _saveData({BuildContext? context, String? docID}) async {
    //_signUp
    final isValid = _formKey.currentState?.validate();
    final fFs = Provider.of<FormFieldService>(context!, listen: false);
    fFs.formFieldServiceValidate();
    if (isValid != null &&
            isValid &&
            fFs.formIsValid == "valid" &&
            docID == null /*&&
        fFs.iAgree == true*/
        ) {
      await database.createApplicants(
          fFs.applyTo,
          fFs.checkApplyToData,
          fFs.differentGrade,
          fFs.gender,
          fFs.maritalStatus,
          fFs.childRelease,
          fFs.custodyCopies,
          fFs.familyOthersWhoTakeCare,
          fFs.otherSchoolAtend,
          fFs.otherSchoolForeignLanguage,
          fFs.otherSchoolMayContact,
          fFs.otherSchoolSpecialEducation,
          fFs.feeSettleAnnually,
          fFs.devComNoRequests,
          fFs.devComNonVerbally,
          fFs.devComVerballySounds,
          fFs.devComVerballySingleWords,
          fFs.devComCompleteSentences,
          fFs.otherSchoolDisciplineAction,
          fFs.otherSchoolHomeSchooled,
          fFs.childName.text,
          fFs.childGFatherName.text,
          fFs.childCitizenship.text,
          fFs.dateOfBirth.text,
          fFs.ageOnAugust.text,
          fFs.divorcedName.text,
          fFs.divorcedRelationship.text,
          fFs.childArea.text,
          fFs.childSubCity.text,
          fFs.childHouseNo.text,
          fFs.emergencyName.text,
          fFs.emergencyChildRelation.text,
          fFs.emergencyPhoneNo.text,
          fFs.fatherFirstName.text,
          fFs.fatherFatherName.text,
          fFs.fatherCitizenship.text,
          fFs.fatherEmployer.text,
          fFs.fatherJobTitle.text,
          fFs.fatherEmail.text,
          fFs.fatherMobileTel.text,
          fFs.fatherWorkTel.text,
          fFs.motherFirstName.text,
          fFs.motherFatherName.text,
          fFs.motherCitizenship.text,
          fFs.motherEmployer.text,
          fFs.motherJobTitle.text,
          fFs.motherEmail.text,
          fFs.motherMobileTel.text,
          fFs.motherWorkTel.text,
          fFs.siblingsAge.text,
          fFs.familyOtherCareName.text,
          fFs.familyCareHowOften.text,
          fFs.familyRegularlySpoken.text,
          fFs.familyReadingLanguage.text,
          fFs.otherSchoolName.text,
          fFs.otherSchoolAddress.text,
          fFs.otherSchoolGradeLevel.text,
          fFs.otherSchoolLanguage.text,
          fFs.otherSchoolLanguageYears.text,
          fFs.otherSchoolMayContactNo.text,
          fFs.otherSchoolSpecialEducationYes.text,
          fFs.otherSchoolWhyLeave.text,
          fFs.devShareWithOthersNo.text,
          fFs.devParticipateInAGroupNo.text,
          fFs.devShortAttentionSpanYes.text,
          fFs.devSpeakPrimaryLanguageNo.text,
          fFs.devMedRequireSupportYes.text,
          fFs.devMedDietaryRestrictionsYes.text,
          fFs.devMedDiagnosedSupportYes.text,
          fFs.devMedDiagnosedLearningYes.text,
          fFs.devMedDiagnosedPhysicalYes.text,
          fFs.devMedDiagnosedBehavioralYes.text,
          fFs.devMedDiagnosedEmotionalYes.text,
          fFs.devMedDiagnosedSpeechYes.text,
          fFs.devMedDiagnosedSocialYes.text,
          fFs.devMedDiagnosedVisionYes.text,
          fFs.devMedDiagnosedSeizuresEpilepsyYes.text,
          fFs.devMedDiagnosedOther.text,
          fFs.devSpecialTalents.text,
          fFs.devAfterschoolActivity.text,
          fFs.devDescribeChild.text,
          fFs.devExampleSupport.text,
          fFs.detailsWhereFoundSchool.text,
          fFs.detailsWhyChooseSchool.text,
          fFs.detailsHopeToGainInSchool.text,
          fFs.devSitAlone.text,
          fFs.devWalkAlone.text,
          fFs.devSaySingleWords.text,
          fFs.devSpeakSentences.text,
          fFs.devHoldOwnCup.text,
          fFs.devFeedSelfWithSpoon.text,
          fFs.devEyeContactSpeakNo.text,
          fFs.devFollowDirectionsNo.text,
          fFs.devDifferentInstructionsNo.text,
          fFs.devSpeechUnderstandableNo.text,
          fFs.devFavoriteToys.text,
          fFs.devActivityAvoids.text,
          fFs.otherSchoolDisciplineActionYes.text,
          fFs.otherSchoolHomeSchooledYes.text,
          fFs.devMedReferredEduPsychologistYes.text,
          fFs.devMedAttentionDeficitYes.text,
          fFs.devMostFavoriteSubject.text,
          fFs.devLeastFavoriteSubject.text,
          fFs.devRegulateEmotions,
          fFs.devConcernForOthers,
          fFs.devShareWithOthers,
          fFs.devParticipateInAGroup,
          fFs.devIsCurious,
          fFs.devPersevere,
          fFs.devWorkIndependently,
          fFs.devFocusOnOneTask,
          fFs.devCommunicateIdeas,
          fFs.devCriticalThinking,
          fFs.devShortAttentionSpan,
          fFs.devMedRequireSupport,
          fFs.devMedDietaryRestrictions,
          fFs.devMedDiagnosedSupport,
          fFs.devMedDiagnosedLearning,
          fFs.devMedDiagnosedPhysical,
          fFs.devMedDiagnosedBehavioral,
          fFs.devMedDiagnosedEmotional,
          fFs.devMedDiagnosedSpeech,
          fFs.devMedDiagnosedSocial,
          fFs.devMedDiagnosedVision,
          fFs.devMedDiagnosedSeizuresEpilepsy,
          fFs.devEmotionallyMatured,
          fFs.devRelateWithPeers,
          fFs.devRelationshipWithAdults,
          fFs.devToiletTrained,
          fFs.devDressThemselves,
          fFs.devFeedThemselves,
          fFs.devWashHandsByThemselves,
          fFs.devPlayPretend,
          fFs.devKnowTheirName,
          fFs.devKnowFatherName,
          fFs.devKnowMotherName,
          fFs.devKnowGender,
          fFs.devKnowAge,
          fFs.devSpeakSoundsPrimaryLanguage,
          fFs.devAfraidToSpeak,
          fFs.devEyeContactSpeak,
          fFs.devFollowDirections,
          fFs.devDifferentInstructions,
          fFs.devSpeechUnderstandable,
          fFs.devSpeakPrimaryLanguage,
          fFs.devAfraidSpeakPublic,
          fFs.devMedReferredEduPsychologist,
          fFs.devMedAttentionDeficit);
      fFs.resetAllData();
      fFs.resetPreData();
      fFs.resetPrimaryData();
      if (mounted) {
        Navigator.pop(context);
      }
      print("it's saving");
    } else if (isValid != null &&
        isValid &&
        fFs.formIsValid == "valid" &&
        docID != null) {
      await database.updateApplicants(
          docID,
          fFs.applyTo,
          fFs.checkApplyToData,
          fFs.differentGrade,
          fFs.gender,
          fFs.maritalStatus,
          fFs.childRelease,
          fFs.custodyCopies,
          fFs.familyOthersWhoTakeCare,
          fFs.otherSchoolAtend,
          fFs.otherSchoolForeignLanguage,
          fFs.otherSchoolMayContact,
          fFs.otherSchoolSpecialEducation,
          fFs.feeSettleAnnually,
          fFs.devComNoRequests,
          fFs.devComNonVerbally,
          fFs.devComVerballySounds,
          fFs.devComVerballySingleWords,
          fFs.devComCompleteSentences,
          fFs.otherSchoolDisciplineAction,
          fFs.otherSchoolHomeSchooled,
          fFs.childName.text,
          fFs.childGFatherName.text,
          fFs.childCitizenship.text,
          fFs.dateOfBirth.text,
          fFs.ageOnAugust.text,
          fFs.divorcedName.text,
          fFs.divorcedRelationship.text,
          fFs.childArea.text,
          fFs.childSubCity.text,
          fFs.childHouseNo.text,
          fFs.emergencyName.text,
          fFs.emergencyChildRelation.text,
          fFs.emergencyPhoneNo.text,
          fFs.fatherFirstName.text,
          fFs.fatherFatherName.text,
          fFs.fatherCitizenship.text,
          fFs.fatherEmployer.text,
          fFs.fatherJobTitle.text,
          fFs.fatherEmail.text,
          fFs.fatherMobileTel.text,
          fFs.fatherWorkTel.text,
          fFs.motherFirstName.text,
          fFs.motherFatherName.text,
          fFs.motherCitizenship.text,
          fFs.motherEmployer.text,
          fFs.motherJobTitle.text,
          fFs.motherEmail.text,
          fFs.motherMobileTel.text,
          fFs.motherWorkTel.text,
          fFs.siblingsAge.text,
          fFs.familyOtherCareName.text,
          fFs.familyCareHowOften.text,
          fFs.familyRegularlySpoken.text,
          fFs.familyReadingLanguage.text,
          fFs.otherSchoolName.text,
          fFs.otherSchoolAddress.text,
          fFs.otherSchoolGradeLevel.text,
          fFs.otherSchoolLanguage.text,
          fFs.otherSchoolLanguageYears.text,
          fFs.otherSchoolMayContactNo.text,
          fFs.otherSchoolSpecialEducationYes.text,
          fFs.otherSchoolWhyLeave.text,
          fFs.devShareWithOthersNo.text,
          fFs.devParticipateInAGroupNo.text,
          fFs.devShortAttentionSpanYes.text,
          fFs.devSpeakPrimaryLanguageNo.text,
          fFs.devMedRequireSupportYes.text,
          fFs.devMedDietaryRestrictionsYes.text,
          fFs.devMedDiagnosedSupportYes.text,
          fFs.devMedDiagnosedLearningYes.text,
          fFs.devMedDiagnosedPhysicalYes.text,
          fFs.devMedDiagnosedBehavioralYes.text,
          fFs.devMedDiagnosedEmotionalYes.text,
          fFs.devMedDiagnosedSpeechYes.text,
          fFs.devMedDiagnosedSocialYes.text,
          fFs.devMedDiagnosedVisionYes.text,
          fFs.devMedDiagnosedSeizuresEpilepsyYes.text,
          fFs.devMedDiagnosedOther.text,
          fFs.devSpecialTalents.text,
          fFs.devAfterschoolActivity.text,
          fFs.devDescribeChild.text,
          fFs.devExampleSupport.text,
          fFs.detailsWhereFoundSchool.text,
          fFs.detailsWhyChooseSchool.text,
          fFs.detailsHopeToGainInSchool.text,
          fFs.devSitAlone.text,
          fFs.devWalkAlone.text,
          fFs.devSaySingleWords.text,
          fFs.devSpeakSentences.text,
          fFs.devHoldOwnCup.text,
          fFs.devFeedSelfWithSpoon.text,
          fFs.devEyeContactSpeakNo.text,
          fFs.devFollowDirectionsNo.text,
          fFs.devDifferentInstructionsNo.text,
          fFs.devSpeechUnderstandableNo.text,
          fFs.devFavoriteToys.text,
          fFs.devActivityAvoids.text,
          fFs.otherSchoolDisciplineActionYes.text,
          fFs.otherSchoolHomeSchooledYes.text,
          fFs.devMedReferredEduPsychologistYes.text,
          fFs.devMedAttentionDeficitYes.text,
          fFs.devMostFavoriteSubject.text,
          fFs.devLeastFavoriteSubject.text,
          fFs.devRegulateEmotions,
          fFs.devConcernForOthers,
          fFs.devShareWithOthers,
          fFs.devParticipateInAGroup,
          fFs.devIsCurious,
          fFs.devPersevere,
          fFs.devWorkIndependently,
          fFs.devFocusOnOneTask,
          fFs.devCommunicateIdeas,
          fFs.devCriticalThinking,
          fFs.devShortAttentionSpan,
          fFs.devMedRequireSupport,
          fFs.devMedDietaryRestrictions,
          fFs.devMedDiagnosedSupport,
          fFs.devMedDiagnosedLearning,
          fFs.devMedDiagnosedPhysical,
          fFs.devMedDiagnosedBehavioral,
          fFs.devMedDiagnosedEmotional,
          fFs.devMedDiagnosedSpeech,
          fFs.devMedDiagnosedSocial,
          fFs.devMedDiagnosedVision,
          fFs.devMedDiagnosedSeizuresEpilepsy,
          fFs.devEmotionallyMatured,
          fFs.devRelateWithPeers,
          fFs.devRelationshipWithAdults,
          fFs.devToiletTrained,
          fFs.devDressThemselves,
          fFs.devFeedThemselves,
          fFs.devWashHandsByThemselves,
          fFs.devPlayPretend,
          fFs.devKnowTheirName,
          fFs.devKnowFatherName,
          fFs.devKnowMotherName,
          fFs.devKnowGender,
          fFs.devKnowAge,
          fFs.devSpeakSoundsPrimaryLanguage,
          fFs.devAfraidToSpeak,
          fFs.devEyeContactSpeak,
          fFs.devFollowDirections,
          fFs.devDifferentInstructions,
          fFs.devSpeechUnderstandable,
          fFs.devSpeakPrimaryLanguage,
          fFs.devAfraidSpeakPublic,
          fFs.devMedReferredEduPsychologist,
          fFs.devMedAttentionDeficit);
      fFs.resetAllData();
      fFs.resetPreData();
      fFs.resetPrimaryData();
      if (mounted) {
        Navigator.pop(context);
      }
      print("it's updated");
    } else {
      print("not saved");
      print(fFs.formIsValid);
      print(fFs.devRegulateEmotions);
      print(fFs.devEmotionallyMatured);
      print(fFs.formIsValid);
      print(fFs.allValid);
      print(fFs.preValid);
      print(fFs.primaryValid);
      //Navigator.pop(context);
      print(docID);
    }
  } /*  */

  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);
    final dialogService = Provider.of<MyDialogBoxService>(context);
    return Form(
      key: _formKey, //formFieldService.formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  const Center(
                      child: Text(
                    "I. PERSONAL DATA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  myDivider(10),
                  const SizedBox(height: 8.0),
                  const CardClassDetails(),
                  const SizedBox(height: 8.0),
                  formFieldService.checkApplyToData == "select" //select
                      ? const SizedBox(height: 0)
                      : Column(
                          children: [
                            const CardChildAndFamilyInfo(),
                            const SizedBox(height: 8.0),
                            const CardFamilyData(),
                            const SizedBox(height: 16.0),
                            const Center(
                                child: Text(
                              "II. PREVIOUS SCHOOL AND DEVELOPMENTAL INFORMATION",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            myDivider(10),
                            const CardPreviousSchoolInfo(),
                            const SizedBox(height: 8.0),
                            const CardDevelopmentalInfo(),
                            const SizedBox(height: 16.0),
                            const Center(
                                child: Text(
                              "III. MORE DETAILS AND SCHOOL FEE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            myDivider(10),
                            const CardMoreDetails(),
                            const SizedBox(height: 8.0),
                            const CardSchoolFee(),
                          ],
                        ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isSaving
                    ? const CircularProgressIndicator()
                    : MyButton(
                        borderRadius: 4.0,
                        onPressed: _isSaving
                            ? null
                            : () => saveDataWithConfirmation(
                                context, widget.documentID),
                        /*() async {
                          //print("_isProcessing: $_isProcessing");
                          final isValid = _formKey.currentState?.validate();
                          if (isValid != null &&
                              isValid &&
                              formFieldService.formIsValid == "valid" &&
                              formFieldService.isEditing == false) {
                            print("showDialogbox");
                            dialogService.openDialogBox(
                              context,
                              const ParentalAgreementPage(),
                            );
                          }
                          setState(() {
                            _isProcessing = true;
                          });
                          await _saveData(
                              context: context, docID: widget.documentID);
                          formFieldService.iAgree = false;
                          setState(() {
                            _isProcessing = false;
                          });
                          /*if (mounted) {
                        Navigator.pop(context);
                      }*/
                          //print("_isProcessing: $_isProcessing");
                        },*/
                        buttonChild: const Text("Save",
                            style: TextStyle(color: Colors.white))),
                MyButton(
                    borderRadius: 4.0,
                    onPressed: () async {
                      formFieldService.iAgree = false;
                      if (mounted) {
                        Navigator.pop(context);
                      }
                    },
                    buttonChild: const Text("Cancel",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
