import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateTimeProvider extends ChangeNotifier {
  // for child and family info

  DateTime dateTime = DateTime.now();
  DateTime lastDate = DateTime.now();
  final myFormat = DateFormat('d/MM/yyyy');

  void showDatePick(BuildContext context) {
    final formFieldService =
        Provider.of<FormFieldService>(context, listen: false);
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: lastDate,
      initialDatePickerMode: DatePickerMode.year,
    ).then((value) {
      if (value != null && value != dateTime) {
        dateTime = value;
        formFieldService.dateOfBirth.text = myFormat.format(dateTime);
        formFieldService.ageOnAugust.text = calculateAge(dateTime);
        notifyListeners();
      }
    });
  }

  String calculateAge(DateTime birthDate) {
    final currentYear = DateTime.now().year;
    final august30 = DateTime(currentYear, 8, 30);

    if (birthDate.isAfter(august30)) {
      final age = currentYear - birthDate.year - 1;
      final remainingMonths = 12 - birthDate.month + 8;
      return '$age years and $remainingMonths months';
    } else {
      if (birthDate.month > 8) {
        final age = currentYear - birthDate.year - 1;
        int remainingMonths = 8 - birthDate.month;
        remainingMonths = 12 + remainingMonths;
        return '$age years and $remainingMonths months';
      } else {
        final age = currentYear - birthDate.year;
        final remainingMonths = 8 - birthDate.month;
        return '$age years and $remainingMonths months';
      }
    }
  }
}

class FormFieldService with ChangeNotifier {
/////////// TEXT FORM FIELD /////////////////////////////

  // for parental agreement
  bool iAgree = false;

  // for FORM
  final GlobalKey<FormState> formKey = GlobalKey();

  // for class details

  // for child and family info
  final TextEditingController childName = TextEditingController();
  final TextEditingController childGFatherName = TextEditingController();
  final TextEditingController childCitizenship = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController ageOnAugust = TextEditingController();
  final TextEditingController divorcedName = TextEditingController();
  final TextEditingController divorcedRelationship = TextEditingController();
  final TextEditingController childArea = TextEditingController();
  final TextEditingController childSubCity = TextEditingController();
  final TextEditingController childHouseNo = TextEditingController();
  final TextEditingController emergencyName = TextEditingController();
  final TextEditingController emergencyChildRelation = TextEditingController();
  final TextEditingController emergencyPhoneNo = TextEditingController();

  // for family data
  final TextEditingController fatherFirstName = TextEditingController();
  final TextEditingController fatherFatherName = TextEditingController();
  final TextEditingController fatherCitizenship = TextEditingController();
  final TextEditingController fatherEmployer = TextEditingController();
  final TextEditingController fatherJobTitle = TextEditingController();
  final TextEditingController fatherEmail = TextEditingController();
  final TextEditingController fatherMobileTel = TextEditingController();
  final TextEditingController fatherWorkTel = TextEditingController();
  final TextEditingController motherFirstName = TextEditingController();
  final TextEditingController motherFatherName = TextEditingController();
  final TextEditingController motherCitizenship = TextEditingController();
  final TextEditingController motherEmployer = TextEditingController();
  final TextEditingController motherJobTitle = TextEditingController();
  final TextEditingController motherEmail = TextEditingController();
  final TextEditingController motherMobileTel = TextEditingController();
  final TextEditingController motherWorkTel = TextEditingController();
  final TextEditingController siblingsAge = TextEditingController();
  final TextEditingController familyRegularlySpoken = TextEditingController();
  final TextEditingController familyReadingLanguage = TextEditingController();
  final TextEditingController familyOtherCareName = TextEditingController();
  final TextEditingController familyCareHowOften = TextEditingController();

  // for previous school
  final TextEditingController otherSchoolName = TextEditingController();
  final TextEditingController otherSchoolAddress = TextEditingController();
  final TextEditingController otherSchoolGradeLevel = TextEditingController();
  final TextEditingController otherSchoolLanguage = TextEditingController();
  final TextEditingController otherSchoolLanguageYears =
      TextEditingController();
  final TextEditingController otherSchoolMayContactNo = TextEditingController();
  final TextEditingController otherSchoolSpecialEducationYes =
      TextEditingController();
  final TextEditingController otherSchoolWhyLeave = TextEditingController();
  final TextEditingController otherSchoolDisciplineActionYes =
      TextEditingController();
  final TextEditingController otherSchoolHomeSchooledYes =
      TextEditingController();

  // for developmental info
  final TextEditingController devSitAlone = TextEditingController();
  final TextEditingController devWalkAlone = TextEditingController();
  final TextEditingController devSaySingleWords = TextEditingController();
  final TextEditingController devSpeakSentences = TextEditingController();
  final TextEditingController devHoldOwnCup = TextEditingController();
  final TextEditingController devFeedSelfWithSpoon = TextEditingController();
  final TextEditingController devMedDiagnosedOther = TextEditingController();
  final TextEditingController devMostFavoriteSubject = TextEditingController();
  final TextEditingController devLeastFavoriteSubject = TextEditingController();
  final TextEditingController devFavoriteToys = TextEditingController();
  final TextEditingController devActivityAvoids = TextEditingController();
  final TextEditingController devSpecialTalents = TextEditingController();
  final TextEditingController devAfterschoolActivity = TextEditingController();
  final TextEditingController devDescribeChild = TextEditingController();
  final TextEditingController devExampleSupport = TextEditingController();

  // if yes or no
  final TextEditingController devShareWithOthersNo = TextEditingController();
  final TextEditingController devParticipateInAGroupNo =
      TextEditingController();
  final TextEditingController devShortAttentionSpanYes =
      TextEditingController();
  final TextEditingController devSpeakPrimaryLanguageNo =
      TextEditingController();
  final TextEditingController devEyeContactSpeakNo = TextEditingController();
  final TextEditingController devFollowDirectionsNo = TextEditingController();
  final TextEditingController devDifferentInstructionsNo =
      TextEditingController();
  final TextEditingController devSpeechUnderstandableNo =
      TextEditingController();
  final TextEditingController devMedRequireSupportYes = TextEditingController();
  final TextEditingController devMedDietaryRestrictionsYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedSupportYes =
      TextEditingController();
  final TextEditingController devMedReferredEduPsychologistYes =
      TextEditingController();
  final TextEditingController devMedAttentionDeficitYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedLearningYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedPhysicalYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedBehavioralYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedEmotionalYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedSpeechYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedSocialYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedVisionYes =
      TextEditingController();
  final TextEditingController devMedDiagnosedSeizuresEpilepsyYes =
      TextEditingController();

  // for more details
  final TextEditingController detailsWhereFoundSchool = TextEditingController();
  final TextEditingController detailsWhyChooseSchool = TextEditingController();
  final TextEditingController detailsHopeToGainInSchool =
      TextEditingController();

/////////// RADIO BUTTON FIELD /////////////////////////////

  // for developmental info
  String? devRegulateEmotions = "";
  String? devConcernForOthers = "";
  String? devShareWithOthers = "";
  String? devParticipateInAGroup = "";
  String? devEmotionallyMatured = "";
  String? devRelateWithPeers = "";
  String? devRelationshipWithAdults = "";
  String? devIsCurious = "";
  String? devPersevere = "";
  String? devWorkIndependently = "";
  String? devFocusOnOneTask = "";
  String? devCommunicateIdeas = "";
  String? devCriticalThinking = "";
  String? devToiletTrained = "";
  String? devDressThemselves = "";
  String? devFeedThemselves = "";
  String? devWashHandsByThemselves = "";
  String? devPlayPretend = "";
  String? devKnowTheirName = "";
  String? devKnowFatherName = "";
  String? devKnowMotherName = "";
  String? devKnowGender = "";
  String? devKnowAge = "";
  String? devShortAttentionSpan = "";
  String? devSpeakPrimaryLanguage = "";
  String? devAfraidSpeakPublic = "";
  String? devSpeakSoundsPrimaryLanguage = "";
  String? devAfraidToSpeak = "";
  String? devEyeContactSpeak = "";
  String? devFollowDirections = "";
  String? devDifferentInstructions = "";
  String? devSpeechUnderstandable = "";
  String? devMedRequireSupport = "";
  String? devMedDietaryRestrictions = "";
  String? devMedDiagnosedSupport = "";
  String? devMedReferredEduPsychologist = "";
  String? devMedAttentionDeficit = "";

  String? devMedDiagnosedLearning = "";
  String? devMedDiagnosedPhysical = "";
  String? devMedDiagnosedBehavioral = "";
  String? devMedDiagnosedEmotional = "";
  String? devMedDiagnosedSpeech = "";
  String? devMedDiagnosedSocial = "";
  String? devMedDiagnosedVision = "";
  String? devMedDiagnosedSeizuresEpilepsy = "";

  // for developmental info
  void changeDevRegulateEmotions({required String newValue}) async {
    devRegulateEmotions = newValue;
    notifyListeners();
  }

  void changeDevConcernForOthers({required String newValue}) async {
    devConcernForOthers = newValue;
    notifyListeners();
  }

  void changeDevShareWithOthers({required String newValue}) async {
    devShareWithOthers = newValue;
    notifyListeners();
  }

  void changeDevParticipateInAGroup({required String newValue}) async {
    devParticipateInAGroup = newValue;
    notifyListeners();
  }

  void changeDevEmotionallyMatured({required String newValue}) async {
    devEmotionallyMatured = newValue;
    notifyListeners();
  }

  void changeDevRelateWithPeers({required String newValue}) async {
    devRelateWithPeers = newValue;
    notifyListeners();
  }

  void changeDevRelationshipWithAdults({required String newValue}) async {
    devRelationshipWithAdults = newValue;
    notifyListeners();
  }

  void changeDevIsCurious({required String newValue}) async {
    devIsCurious = newValue;
    notifyListeners();
  }

  void changeDevPersevere({required String newValue}) async {
    devPersevere = newValue;
    notifyListeners();
  }

  void changeDevWorkIndependently({required String newValue}) async {
    devWorkIndependently = newValue;
    notifyListeners();
  }

  void changeDevFocusOnOneTask({required String newValue}) async {
    devFocusOnOneTask = newValue;
    notifyListeners();
  }

  void changeDevCommunicateIdeas({required String newValue}) async {
    devCommunicateIdeas = newValue;
    notifyListeners();
  }

  void changeDevCriticalThinking({required String newValue}) async {
    devCriticalThinking = newValue;
    notifyListeners();
  }

  void changeDevToiletTrained({required String newValue}) async {
    devToiletTrained = newValue;
    notifyListeners();
  }

  void changeDevDressThemselves({required String newValue}) async {
    devDressThemselves = newValue;
    notifyListeners();
  }

  void changeDevFeedThemselves({required String newValue}) async {
    devFeedThemselves = newValue;
    notifyListeners();
  }

  void changeDevWashHandsByThemselves({required String newValue}) async {
    devWashHandsByThemselves = newValue;
    notifyListeners();
  }

  void changeDevPlayPretend({required String newValue}) async {
    devPlayPretend = newValue;
    notifyListeners();
  }

  void changeDevKnowTheirName({required String newValue}) async {
    devKnowTheirName = newValue;
    notifyListeners();
  }

  void changeDdevKnowFatherName({required String newValue}) async {
    devKnowFatherName = newValue;
    notifyListeners();
  }

  void changeDdevKnowMotherName({required String newValue}) async {
    devKnowMotherName = newValue;
    notifyListeners();
  }

  void changeDevKnowGender({required String newValue}) async {
    devKnowGender = newValue;
    notifyListeners();
  }

  void changeDevKnowAge({required String newValue}) async {
    devKnowAge = newValue;
    notifyListeners();
  }

  void changeDevShortAttentionSpan({required String newValue}) async {
    devShortAttentionSpan = newValue;
    notifyListeners();
  }

  void changeDevSpeakPrimaryLanguage({required String newValue}) async {
    devSpeakPrimaryLanguage = newValue;
    notifyListeners();
  }

  void changeDevAfraidSpeakPublic({required String newValue}) async {
    devAfraidSpeakPublic = newValue;
    notifyListeners();
  }

  void changeDevSpeakSoundsPrimaryLanguage({required String newValue}) async {
    devSpeakSoundsPrimaryLanguage = newValue;
    notifyListeners();
  }

  void changeDevAfraidToSpeak({required String newValue}) async {
    devAfraidToSpeak = newValue;
    notifyListeners();
  }

  void changeDevEyeContactSpeak({required String newValue}) async {
    devEyeContactSpeak = newValue;
    notifyListeners();
  }

  void changeDevFollowDirections({required String newValue}) async {
    devFollowDirections = newValue;
    notifyListeners();
  }

  void changeDevDifferentInstructions({required String newValue}) async {
    devDifferentInstructions = newValue;
    notifyListeners();
  }

  void changeDevSpeechUnderstandable({required String newValue}) async {
    devSpeechUnderstandable = newValue;
    notifyListeners();
  }

  void changeDevMedRequireSupport({required String newValue}) async {
    devMedRequireSupport = newValue;
    notifyListeners();
  }

  void changeDevMedDietaryRestrictions({required String newValue}) async {
    devMedDietaryRestrictions = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedSupport({required String newValue}) async {
    devMedDiagnosedSupport = newValue;
    notifyListeners();
  }

  void changeDevMedReferredEduPsychologist({required String newValue}) async {
    devMedReferredEduPsychologist = newValue;
    notifyListeners();
  }

  void changeDevMedAttentionDeficit({required String newValue}) async {
    devMedAttentionDeficit = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedLearning({required String newValue}) async {
    devMedDiagnosedLearning = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedPhysical({required String newValue}) async {
    devMedDiagnosedPhysical = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedBehavioral({required String newValue}) async {
    devMedDiagnosedBehavioral = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedEmotional({required String newValue}) async {
    devMedDiagnosedEmotional = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedSpeech({required String newValue}) async {
    devMedDiagnosedSpeech = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedSocial({required String newValue}) async {
    devMedDiagnosedSocial = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedVision({required String newValue}) async {
    devMedDiagnosedVision = newValue;
    notifyListeners();
  }

  void changeDevMedDiagnosedSeizuresEpilepsy({required String newValue}) async {
    devMedDiagnosedSeizuresEpilepsy = newValue;
    notifyListeners();
  }

/////////// DROP DOWN LIST FIELD /////////////////////////////

// for class details
  String applyTo = "select";
  String checkApplyToData = "select";
  String differentGrade = "select";

  // for child and family info
  String gender = "select";
  String maritalStatus = "select";
  String childRelease = "select";
  String custodyCopies = "select";

  // for family data
  String familyOthersWhoTakeCare = "select";

  // for previous school
  String otherSchoolAtend = "select";
  String otherSchoolDisciplineAction = "select";
  String otherSchoolHomeSchooled = "select";
  String otherSchoolForeignLanguage = "select";
  String otherSchoolMayContact = "select";
  String otherSchoolSpecialEducation = "select";

  // for developmental info

  String devComNoRequests = "select";
  String devComNonVerbally = "select";
  String devComVerballySounds = "select";
  String devComVerballySingleWords = "select";
  String devComCompleteSentences = "select";

  // for school fee
  String feeSettleAnnually = "select";

  // for class details
  void changeApplyTo({required String newValue}) async {
    applyTo = newValue;
    checkApplyTo();
    notifyListeners();
  }

  void changeDifferentGrade({required String newValue}) async {
    differentGrade = newValue;
    notifyListeners();
  }

  // for child and family info
  void changeGender({required String newValue}) async {
    gender = newValue;
    notifyListeners();
  }

  void changeFamilyOthersWhoTakeCare({required String newValue}) async {
    familyOthersWhoTakeCare = newValue;
    notifyListeners();
  }

  // for family data
  void changeMaritalStatus({required String newValue}) async {
    maritalStatus = newValue;
    notifyListeners();
  }

  void changeChildRelease({required String newValue}) async {
    childRelease = newValue;
    notifyListeners();
  }

  void changeCustodyCopies({required String newValue}) async {
    custodyCopies = newValue;
    notifyListeners();
  }

  // for previous school
  void changeOtherSchoolAtend({required String newValue}) async {
    otherSchoolAtend = newValue;
    notifyListeners();
  }

  void changeOtherSchoolDisciplineAction({required String newValue}) async {
    otherSchoolDisciplineAction = newValue;
    notifyListeners();
  }

  void changeOtherSchoolHomeSchooled({required String newValue}) async {
    otherSchoolHomeSchooled = newValue;
    notifyListeners();
  }

  void changeOtherSchoolForeignLanguage({required String newValue}) async {
    otherSchoolForeignLanguage = newValue;
    notifyListeners();
  }

  void changeOtherSchoolMayContact({required String newValue}) async {
    otherSchoolMayContact = newValue;
    notifyListeners();
  }

  void changeOtherSchoolSpecialEducation({required String newValue}) async {
    otherSchoolSpecialEducation = newValue;
    notifyListeners();
  }

  // for developmental info
  void changeDevComNoRequests({required String newValue}) async {
    devComNoRequests = newValue;
    notifyListeners();
  }

  void changeDevComNonVerbally({required String newValue}) async {
    devComNonVerbally = newValue;
    notifyListeners();
  }

  void changeDevComVerballySounds({required String newValue}) async {
    devComVerballySounds = newValue;
    notifyListeners();
  }

  void changeDevComVerballySingleWords({required String newValue}) async {
    devComVerballySingleWords = newValue;
    notifyListeners();
  }

  void changeDevComCompleteSentences({required String newValue}) async {
    devComCompleteSentences = newValue;
    notifyListeners();
  }

  // for school fee
  void changeFeeSettleAnnually({required String newValue}) async {
    feeSettleAnnually = newValue;
    notifyListeners();
  }

///// check grade applied to for the form field ///////
  void checkApplyTo() async {
    if (applyTo == "select") {
      checkApplyToData = "select";
    } else if (applyTo == "Foundation (Age 2.0-3.0)" ||
        applyTo == "Pre-Nursery (Age 3.0-4.0)" ||
        applyTo == "Nursery (Age 4.0-4.5)" ||
        applyTo == "KG (Age 5.0-5.5)")
    ////////////////////
    {
      checkApplyToData = "pre";
      resetPrimaryData();
    } else {
      checkApplyToData = "other";
      resetPreData();
    }
    notifyListeners();
  }

///// validate FORM FIELD (specially radio button) ///////

  String allValid = "no";
  String preValid = "no";
  String primaryValid = "no";
  String formIsValid = "not valid";

  void formFieldServiceValidate() {
    // for all
    if (devRegulateEmotions == "" ||
        devConcernForOthers == "" ||
        devShareWithOthers == "" ||
        devParticipateInAGroup == "" ||
        devIsCurious == "" ||
        devPersevere == "" ||
        devWorkIndependently == "" ||
        devFocusOnOneTask == "" ||
        devCommunicateIdeas == "" ||
        devCriticalThinking == "" ||
        devShortAttentionSpan == "" ||
        devMedRequireSupport == "" ||
        devMedDietaryRestrictions == "" ||
        devMedDiagnosedSupport == "" ||
        devMedDiagnosedLearning == "" ||
        devMedDiagnosedPhysical == "" ||
        devMedDiagnosedBehavioral == "" ||
        devMedDiagnosedEmotional == "" ||
        devMedDiagnosedSpeech == "" ||
        devMedDiagnosedSocial == "" ||
        devMedDiagnosedVision == "" ||
        devMedDiagnosedSeizuresEpilepsy == "") {
      allValid = "no";
    } else {
      allValid = "yes";
    }
    // for primary
    if (checkApplyToData == "other") {
      if (devSpeakPrimaryLanguage == "" ||
          devAfraidSpeakPublic == "" ||
          devMedReferredEduPsychologist == "" ||
          devMedAttentionDeficit == "") {
        primaryValid = "no";
      } else {
        primaryValid = "yes";
      }
    } else {
      primaryValid = "yes";
    }
    // for pre
    if (checkApplyToData == "pre") {
      if (devEmotionallyMatured == "" ||
          devRelateWithPeers == "" ||
          devRelationshipWithAdults == "" ||
          devToiletTrained == "" ||
          devDressThemselves == "" ||
          devFeedThemselves == "" ||
          devWashHandsByThemselves == "" ||
          devPlayPretend == "" ||
          devKnowTheirName == "" ||
          devKnowFatherName == "" ||
          devKnowMotherName == "" ||
          devKnowGender == "" ||
          devKnowAge == "" ||
          devSpeakSoundsPrimaryLanguage == "" ||
          devAfraidToSpeak == "" ||
          devEyeContactSpeak == "" ||
          devFollowDirections == "" ||
          devDifferentInstructions == "" ||
          devSpeechUnderstandable == "") {
        preValid = "no";
      } else {
        preValid = "yes";
      }
    } else {
      preValid = "yes";
    }

    if (allValid == "yes" && preValid == "yes" && primaryValid == "yes") {
      formIsValid = "valid";
    } else {
      formIsValid = "not valid";
    }
    notifyListeners();
  }

  //////// RESET ALL FORM FIELDS /////////////

  bool isEditing = false;

  /* */ void resetAllData() {
    // dropdown
    // class details
    applyTo = "select";
    checkApplyToData = "select";
    differentGrade = "select";
    // child and family
    gender = "select";
    maritalStatus = "select";
    childRelease = "select";
    custodyCopies = "select";
    // family data
    familyOthersWhoTakeCare = "select";
    // previous school
    otherSchoolAtend = "select";
    otherSchoolForeignLanguage = "select";
    otherSchoolMayContact = "select";
    otherSchoolSpecialEducation = "select";
    // school fee
    feeSettleAnnually = "select";

    // text field
    //child and family
    childName.clear();
    childGFatherName.clear();
    childCitizenship.clear();
    dateOfBirth.clear();
    ageOnAugust.clear();
    divorcedName.clear();
    divorcedRelationship.clear();
    childArea.clear();
    childSubCity.clear();
    childHouseNo.clear();
    emergencyName.clear();
    emergencyChildRelation.clear();
    emergencyPhoneNo.clear();
    // family data
    fatherFirstName.clear();
    fatherFatherName.clear();
    fatherCitizenship.clear();
    fatherEmployer.clear();
    fatherJobTitle.clear();
    fatherEmail.clear();
    fatherMobileTel.clear();
    fatherWorkTel.clear();
    motherFirstName.clear();
    motherFatherName.clear();
    motherCitizenship.clear();
    motherEmployer.clear();
    motherJobTitle.clear();
    motherEmail.clear();
    motherMobileTel.clear();
    motherWorkTel.clear();
    siblingsAge.clear();
    familyOtherCareName.clear();
    familyCareHowOften.clear();
    familyRegularlySpoken.clear();
    familyReadingLanguage.clear();
    // previous school
    otherSchoolName.clear();
    otherSchoolAddress.clear();
    otherSchoolGradeLevel.clear();
    otherSchoolLanguage.clear();
    otherSchoolLanguageYears.clear();
    otherSchoolMayContactNo.clear();
    otherSchoolSpecialEducationYes.clear();
    otherSchoolWhyLeave.clear();
    // developmental info
    devShareWithOthersNo.clear();
    devParticipateInAGroupNo.clear();
    devShortAttentionSpanYes.clear();
    devSpeakPrimaryLanguageNo.clear();
    devMedRequireSupportYes.clear();
    devMedDietaryRestrictionsYes.clear();
    devMedDiagnosedSupportYes.clear();
    devMedDiagnosedLearningYes.clear();
    devMedDiagnosedPhysicalYes.clear();
    devMedDiagnosedBehavioralYes.clear();
    devMedDiagnosedEmotionalYes.clear();
    devMedDiagnosedSpeechYes.clear();
    devMedDiagnosedSocialYes.clear();
    devMedDiagnosedVisionYes.clear();
    devMedDiagnosedSeizuresEpilepsyYes.clear();
    devMedDiagnosedOther.clear();
    devSpecialTalents.clear();
    devAfterschoolActivity.clear();
    devDescribeChild.clear();
    devExampleSupport.clear();
    // more details
    detailsWhereFoundSchool.clear();
    detailsWhyChooseSchool.clear();
    detailsHopeToGainInSchool.clear();

    // radio button
    // developmental info
    devRegulateEmotions = "";
    devConcernForOthers = "";
    devShareWithOthers = "";
    devParticipateInAGroup = "";
    devIsCurious = "";
    devPersevere = "";
    devWorkIndependently = "";
    devFocusOnOneTask = "";
    devCommunicateIdeas = "";
    devCriticalThinking = "";
    devShortAttentionSpan = "";
    devMedRequireSupport = "";
    devMedDietaryRestrictions = "";
    devMedDiagnosedSupport = "";
    devMedDiagnosedLearning = "";
    devMedDiagnosedPhysical = "";
    devMedDiagnosedBehavioral = "";
    devMedDiagnosedEmotional = "";
    devMedDiagnosedSpeech = "";
    devMedDiagnosedSocial = "";
    devMedDiagnosedVision = "";
    devMedDiagnosedSeizuresEpilepsy = "";
  }

  void resetPreData() {
    // dropdown
    // developmental info
    devComNoRequests = "select";
    devComNonVerbally = "select";
    devComVerballySounds = "select";
    devComVerballySingleWords = "select";
    devComCompleteSentences = "select";

    // text field
    // developmental info
    devSitAlone.clear();
    devWalkAlone.clear();
    devSaySingleWords.clear();
    devSpeakSentences.clear();
    devHoldOwnCup.clear();
    devFeedSelfWithSpoon.clear();
    devEyeContactSpeakNo.clear();
    devFollowDirectionsNo.clear();
    devDifferentInstructionsNo.clear();
    devSpeechUnderstandableNo.clear();
    devFavoriteToys.clear();
    devActivityAvoids.clear();

    // radio button
    // developmental info
    devEmotionallyMatured = "";
    devRelateWithPeers = "";
    devRelationshipWithAdults = "";
    devToiletTrained = "";
    devDressThemselves = "";
    devFeedThemselves = "";
    devWashHandsByThemselves = "";
    devPlayPretend = "";
    devKnowTheirName = "";
    devKnowFatherName = "";
    devKnowMotherName = "";
    devKnowGender = "";
    devKnowAge = "";
    devSpeakSoundsPrimaryLanguage = "";
    devAfraidToSpeak = "";
    devEyeContactSpeak = "";
    devFollowDirections = "";
    devDifferentInstructions = "";
    devSpeechUnderstandable = "";
  }

  void resetPrimaryData() {
    // dropdown
    // previous school
    otherSchoolDisciplineAction = "select";
    otherSchoolHomeSchooled = "select";

    // text field
    // previous school
    otherSchoolDisciplineActionYes.clear();
    otherSchoolHomeSchooledYes.clear();
    // developmental info
    devMedReferredEduPsychologistYes.clear();
    devMedAttentionDeficitYes.clear();
    devMostFavoriteSubject.clear();
    devLeastFavoriteSubject.clear();

    // radio button
    // developmental info
    devSpeakPrimaryLanguage = "";
    devAfraidSpeakPublic = "";
    devMedReferredEduPsychologist = "";
    devMedAttentionDeficit = "";
  }

/*
  Future<void> saveData() async {
    final isValid = formKey.currentState?.validate();
    formFieldServiceValidate();
    if (isValid != null && isValid && formIsValid == "valid") {
      print("it's saving");
    } else {
      print("not saved");
      print(formIsValid);
      print(devRegulateEmotions);
      print(devEmotionallyMatured);
      print(formIsValid);
      print(allValid);
      print(preValid);
      print(primaryValid);
    }
  }
  */
}

List<String> applyToItems = [
  "select",
  "Foundation (Age 2.0-3.0)",
  "Pre-Nursery (Age 3.0-4.0)",
  "Nursery (Age 4.0-4.5)",
  "KG (Age 5.0-5.5)",
  "Preparatory Age 6+",
  "Grade 1 (Age 7+)",
  "Grade 2 (Age 8+)",
  "Grade 3 (Age 9+)",
  "Grade 4 (Age 10+)",
  "Grade 5 (Age 11+)",
  "Grade 6 (Age 12+)",
  "Grade 7 (Age 13+)",
  "Grade 8 (Age 14+)",
];
List<String> yesNoItems = [
  "select",
  "Yes",
  "No",
];
List<String> yesSometimesNoItems = [
  "select",
  "Yes",
  "Sometimes",
  "Not yet",
  "No",
];
List<String> maritalStatusItems = [
  "select",
  "Married",
  "Divorced",
  "Single",
  "Widowed",
];
List<String> genderItems = [
  "select",
  "Male",
  "Female",
];
