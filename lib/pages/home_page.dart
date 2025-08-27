import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mald_registration_app02/pages/Registration_form_page.dart';
import 'package:mald_registration_app02/pages/pdf_generator.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/services/firebase_crud.dart';
import 'package:mald_registration_app02/ui/card_lists/card_FAQ.dart';
import 'package:mald_registration_app02/ui/card_lists/card_school_fee_table.dart';
import 'package:mald_registration_app02/ui/main_header.dart';
import 'package:mald_registration_app02/ui/my_dialog_box_service.dart';
import 'package:mald_registration_app02/widgets/my_button_widget.dart';
import 'package:mald_registration_app02/widgets/my_divider_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreDatabase database = FirestoreDatabase();
  bool _isProcessing = false;
  //String docId = "";

  Future<void> _cloneDataWithDocID({String? docID}) async {
    print("clone docID: $docID");
    final fFs = Provider.of<FormFieldService>(context, listen: false);
    final docSnapshot = await database.getApplicantById(docID);
    final data = docSnapshot?.data() as Map<String, dynamic>;
    print(data['applyTo']);

    if (docSnapshot != null) {
      fFs.applyTo = data['applyTo'] as String;
      fFs.checkApplyToData = data['checkApplyToData'] as String;
      fFs.differentGrade = data['differentGrade'] as String;
      fFs.gender = data['gender'] as String;
      fFs.maritalStatus = data['maritalStatus'] as String;
      fFs.childRelease = data['childRelease'] as String;
      fFs.custodyCopies = data['custodyCopies'] as String;
      fFs.familyOthersWhoTakeCare = data['familyOthersWhoTakeCare'] as String;
      fFs.otherSchoolAtend = data['otherSchoolAtend'] as String;
      fFs.otherSchoolForeignLanguage =
          data['otherSchoolForeignLanguage'] as String;
      fFs.otherSchoolMayContact = data['otherSchoolMayContact'] as String;
      fFs.otherSchoolSpecialEducation =
          data['otherSchoolSpecialEducation'] as String;
      fFs.feeSettleAnnually = data['feeSettleAnnually'] as String;
      fFs.devComNoRequests = data['devComNoRequests'] as String;
      fFs.devComNonVerbally = data['devComNonVerbally'] as String;
      fFs.devComVerballySounds = data['devComVerballySounds'] as String;
      fFs.devComVerballySingleWords =
          data['devComVerballySingleWords'] as String;
      fFs.devComCompleteSentences = data['devComCompleteSentences'] as String;
      fFs.otherSchoolDisciplineAction =
          data['otherSchoolDisciplineAction'] as String;
      fFs.otherSchoolHomeSchooled = data['otherSchoolHomeSchooled'] as String;
      fFs.childName.text = data['childName'] as String;
      fFs.childGFatherName.text = data['childGFatherName'] as String;
      fFs.childCitizenship.text = data['childCitizenship'] as String;
      fFs.dateOfBirth.text = data['dateOfBirth'] as String;
      fFs.ageOnAugust.text = data['ageOnAugust'] as String;
      fFs.divorcedName.text = data['divorcedName'] as String;
      fFs.divorcedRelationship.text = data['divorcedRelationship'] as String;
      fFs.childArea.text = data['childArea'] as String;
      fFs.childSubCity.text = data['childSubCity'] as String;
      fFs.childHouseNo.text = data['childHouseNo'] as String;
      fFs.emergencyName.text = data['emergencyName'] as String;
      fFs.emergencyChildRelation.text =
          data['emergencyChildRelation'] as String;
      fFs.emergencyPhoneNo.text = data['emergencyPhoneNo'] as String;
      fFs.fatherFirstName.text = data['fatherFirstName'] as String;
      fFs.fatherFatherName.text = data['fatherFatherName'] as String;
      fFs.fatherCitizenship.text = data['fatherCitizenship'] as String;
      fFs.fatherEmployer.text = data['fatherEmployer'] as String;
      fFs.fatherJobTitle.text = data['fatherJobTitle'] as String;
      fFs.fatherEmail.text = data['fatherEmail'] as String;
      fFs.fatherMobileTel.text = data['fatherMobileTel'] as String;
      fFs.fatherWorkTel.text = data['fatherWorkTel'] as String;
      fFs.motherFirstName.text = data['motherFirstName'] as String;
      fFs.motherFatherName.text = data['motherFatherName'] as String;
      fFs.motherCitizenship.text = data['motherCitizenship'] as String;
      fFs.motherEmployer.text = data['motherEmployer'] as String;
      fFs.motherJobTitle.text = data['motherJobTitle'] as String;
      fFs.motherEmail.text = data['motherEmail'] as String;
      fFs.motherMobileTel.text = data['motherMobileTel'] as String;
      fFs.motherWorkTel.text = data['motherWorkTel'] as String;
      fFs.siblingsAge.text = data['siblingsAge'] as String;
      fFs.familyOtherCareName.text = data['familyOtherCareName'] as String;
      fFs.familyCareHowOften.text = data['familyCareHowOften'] as String;
      fFs.familyRegularlySpoken.text = data['familyRegularlySpoken'] as String;
      fFs.familyReadingLanguage.text = data['familyReadingLanguage'] as String;
      fFs.otherSchoolName.text = data['otherSchoolName'] as String;
      fFs.otherSchoolAddress.text = data['otherSchoolAddress'] as String;
      fFs.otherSchoolGradeLevel.text = data['otherSchoolGradeLevel'] as String;
      fFs.otherSchoolLanguage.text = data['otherSchoolLanguage'] as String;
      fFs.otherSchoolLanguageYears.text =
          data['otherSchoolLanguageYears'] as String;
      fFs.otherSchoolMayContactNo.text =
          data['otherSchoolMayContactNo'] as String;
      fFs.otherSchoolSpecialEducationYes.text =
          data['otherSchoolSpecialEducationYes'] as String;
      fFs.otherSchoolWhyLeave.text = data['otherSchoolWhyLeave'] as String;
      fFs.devShareWithOthersNo.text = data['devShareWithOthersNo'] as String;
      fFs.devParticipateInAGroupNo.text =
          data['devParticipateInAGroupNo'] as String;
      fFs.devShortAttentionSpanYes.text =
          data['devShortAttentionSpanYes'] as String;
      fFs.devSpeakPrimaryLanguageNo.text =
          data['devSpeakPrimaryLanguageNo'] as String;
      fFs.devMedRequireSupportYes.text =
          data['devMedRequireSupportYes'] as String;
      fFs.devMedDietaryRestrictionsYes.text =
          data['devMedDietaryRestrictionsYes'] as String;
      fFs.devMedDiagnosedSupportYes.text =
          data['devMedDiagnosedSupportYes'] as String;
      fFs.devMedDiagnosedLearningYes.text =
          data['devMedDiagnosedLearningYes'] as String;
      fFs.devMedDiagnosedPhysicalYes.text =
          data['devMedDiagnosedPhysicalYes'] as String;
      fFs.devMedDiagnosedBehavioralYes.text =
          data['devMedDiagnosedBehavioralYes'] as String;
      fFs.devMedDiagnosedEmotionalYes.text =
          data['devMedDiagnosedEmotionalYes'] as String;
      fFs.devMedDiagnosedSpeechYes.text =
          data['devMedDiagnosedSpeechYes'] as String;
      fFs.devMedDiagnosedSocialYes.text =
          data['devMedDiagnosedSocialYes'] as String;
      fFs.devMedDiagnosedVisionYes.text =
          data['devMedDiagnosedVisionYes'] as String;
      fFs.devMedDiagnosedSeizuresEpilepsyYes.text =
          data['devMedDiagnosedSeizuresEpilepsyYes'] as String;
      fFs.devMedDiagnosedOther.text = data['devMedDiagnosedOther'] as String;
      fFs.devSpecialTalents.text = data['devSpecialTalents'] as String;
      fFs.devAfterschoolActivity.text =
          data['devAfterschoolActivity'] as String;
      fFs.devDescribeChild.text = data['devDescribeChild'] as String;
      fFs.devExampleSupport.text = data['devExampleSupport'] as String;
      fFs.detailsWhereFoundSchool.text =
          data['detailsWhereFoundSchool'] as String;
      fFs.detailsWhyChooseSchool.text =
          data['detailsWhyChooseSchool'] as String;
      fFs.detailsHopeToGainInSchool.text =
          data['detailsHopeToGainInSchool'] as String;
      fFs.devSitAlone.text = data['devSitAlone'] as String;
      fFs.devWalkAlone.text = data['devWalkAlone'] as String;
      fFs.devSaySingleWords.text = data['devSaySingleWords'] as String;
      fFs.devSpeakSentences.text = data['devSpeakSentences'] as String;
      fFs.devHoldOwnCup.text = data['devHoldOwnCup'] as String;
      fFs.devFeedSelfWithSpoon.text = data['devFeedSelfWithSpoon'] as String;
      fFs.devEyeContactSpeakNo.text = data['devEyeContactSpeakNo'] as String;
      fFs.devFollowDirectionsNo.text = data['devFollowDirectionsNo'] as String;
      fFs.devDifferentInstructionsNo.text =
          data['devDifferentInstructionsNo'] as String;
      fFs.devSpeechUnderstandableNo.text =
          data['devSpeechUnderstandableNo'] as String;
      fFs.devFavoriteToys.text = data['devFavoriteToys'] as String;
      fFs.devActivityAvoids.text = data['devActivityAvoids'] as String;
      fFs.otherSchoolDisciplineActionYes.text =
          data['otherSchoolDisciplineActionYes'] as String;
      fFs.otherSchoolHomeSchooledYes.text =
          data['otherSchoolHomeSchooledYes'] as String;
      fFs.devMedReferredEduPsychologistYes.text =
          data['devMedReferredEduPsychologistYes'] as String;
      fFs.devMedAttentionDeficitYes.text =
          data['devMedAttentionDeficitYes'] as String;
      fFs.devMostFavoriteSubject.text =
          data['devMostFavoriteSubject'] as String;
      fFs.devLeastFavoriteSubject.text =
          data['devLeastFavoriteSubject'] as String;
      fFs.devRegulateEmotions = data['devRegulateEmotions'] as String;
      fFs.devConcernForOthers = data['devConcernForOthers'] as String;
      fFs.devShareWithOthers = data['devShareWithOthers'] as String;
      fFs.devParticipateInAGroup = data['devParticipateInAGroup'] as String;
      fFs.devIsCurious = data['devIsCurious'] as String;
      fFs.devPersevere = data['devPersevere'] as String;
      fFs.devWorkIndependently = data['devWorkIndependently'] as String;
      fFs.devFocusOnOneTask = data['devFocusOnOneTask'] as String;
      fFs.devCommunicateIdeas = data['devCommunicateIdeas'] as String;
      fFs.devCriticalThinking = data['devCriticalThinking'] as String;
      fFs.devShortAttentionSpan = data['devShortAttentionSpan'] as String;
      fFs.devMedRequireSupport = data['devMedRequireSupport'] as String;
      fFs.devMedDietaryRestrictions =
          data['devMedDietaryRestrictions'] as String;
      fFs.devMedDiagnosedSupport = data['devMedDiagnosedSupport'] as String;
      fFs.devMedDiagnosedLearning = data['devMedDiagnosedLearning'] as String;
      fFs.devMedDiagnosedPhysical = data['devMedDiagnosedPhysical'] as String;
      fFs.devMedDiagnosedBehavioral =
          data['devMedDiagnosedBehavioral'] as String;
      fFs.devMedDiagnosedEmotional = data['devMedDiagnosedEmotional'] as String;
      fFs.devMedDiagnosedSpeech = data['devMedDiagnosedSpeech'] as String;
      fFs.devMedDiagnosedSocial = data['devMedDiagnosedSocial'] as String;
      fFs.devMedDiagnosedVision = data['devMedDiagnosedVision'] as String;
      fFs.devMedDiagnosedSeizuresEpilepsy =
          data['devMedDiagnosedSeizuresEpilepsy'] as String;
      fFs.devEmotionallyMatured = data['devEmotionallyMatured'] as String;
      fFs.devRelateWithPeers = data['devRelateWithPeers'] as String;
      fFs.devRelationshipWithAdults =
          data['devRelationshipWithAdults'] as String;
      fFs.devToiletTrained = data['devToiletTrained'] as String;
      fFs.devDressThemselves = data['devDressThemselves'] as String;
      fFs.devFeedThemselves = data['devFeedThemselves'] as String;
      fFs.devWashHandsByThemselves = data['devWashHandsByThemselves'] as String;
      fFs.devPlayPretend = data['devPlayPretend'] as String;
      fFs.devKnowTheirName = data['devKnowTheirName'] as String;
      fFs.devKnowFatherName = data['devKnowFatherName'] as String;
      fFs.devKnowMotherName = data['devKnowMotherName'] as String;
      fFs.devKnowGender = data['devKnowGender'] as String;
      fFs.devKnowAge = data['devKnowAge'] as String;
      fFs.devSpeakSoundsPrimaryLanguage =
          data['devSpeakSoundsPrimaryLanguage'] as String;
      fFs.devAfraidToSpeak = data['devAfraidToSpeak'] as String;
      fFs.devEyeContactSpeak = data['devEyeContactSpeak'] as String;
      fFs.devFollowDirections = data['devFollowDirections'] as String;
      fFs.devDifferentInstructions = data['devDifferentInstructions'] as String;
      fFs.devSpeechUnderstandable = data['devSpeechUnderstandable'] as String;
      fFs.devSpeakPrimaryLanguage = data['devSpeakPrimaryLanguage'] as String;
      fFs.devAfraidSpeakPublic = data['devAfraidSpeakPublic'] as String;
      fFs.devMedReferredEduPsychologist =
          data['devMedReferredEduPsychologist'] as String;
      fFs.devMedAttentionDeficit = data['devMedAttentionDeficit'] as String;
    } else {
      print("No document found with ID: $docID");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogService = Provider.of<MyDialogBoxService>(context);
    final formFieldService = Provider.of<FormFieldService>(context);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF1F6FF),
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: MyMainHeader(),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                width: 800,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFF1F6FF),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueAccent.withOpacity(0.16),
                        ),
                      ),
                      child: const Center(
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.blueAccent,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: -10),
                          indicator: BoxDecoration(
                            color: Color(0xffcddeff),
                          ),
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: Text(
                                'ALL APPLICATIONS',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'PRICING',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'FAQ',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.09),
                          border: Border.all(
                            color: Colors.blueAccent.withOpacity(0.16),
                          ),
                        ),
                        child: TabBarView(children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 16),
                                MyButton(
                                  borderRadius: 4,
                                  onPressed: () {
                                    if (formFieldService.isEditing == true) {
                                      formFieldService.resetAllData();
                                      formFieldService.resetPreData();
                                      formFieldService.resetPrimaryData();
                                      formFieldService.isEditing = false;
                                    }
                                    dialogService.openDialogBox(
                                      context,
                                      RegistrationFormPage(
                                        documentID: null,
                                      ),
                                    );
                                  },
                                  buttonChild: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, color: Colors.white),
                                      Text("ADD NEW",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                                myDivider(30),
                                // for application list
                                StreamBuilder<QuerySnapshot>(
                                    stream: database.getApplicantsStream(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List applicantsList =
                                            snapshot.data!.docs;

                                        // display as list
                                        return Flexible(
                                          child: ListView.builder(
                                            itemCount: applicantsList.length,
                                            itemBuilder: (context, index) {
                                              DocumentSnapshot document =
                                                  applicantsList[index];
                                              String docID = document.id;

                                              // get applicants from each doc
                                              Map<String, dynamic> data =
                                                  document.data()
                                                      as Map<String, dynamic>;
                                              String childName =
                                                  data['childName'];
                                              String childGFatherName =
                                                  data['childGFatherName'];
                                              String applyTo = data['applyTo'];
                                              //String docId = docID;
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: const Color(
                                                              0xffcddeff))
                                                      //shape: BoxShape.circle,
                                                      //shape: BoxShape.circle,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: ListTile(
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      title: Text(
                                                          "Childs name: $childName $childGFatherName"),
                                                      subtitle: Text(
                                                          "Applying For: $applyTo"), //\nDocument ID: $docID"),
                                                      trailing: _isProcessing
                                                          ? const CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.red,
                                                              ),
                                                            )
                                                          : Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                // PRINT BUTTON
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          true;
                                                                    });
                                                                    formFieldService
                                                                            .isEditing =
                                                                        true;
                                                                    print(formFieldService
                                                                        .isEditing);
                                                                    await _cloneDataWithDocID(
                                                                        docID:
                                                                            docID);
                                                                    PDFGenerator
                                                                        pdfGenerator =
                                                                        PDFGenerator();
                                                                    if (mounted) {
                                                                      await pdfGenerator
                                                                          .generatePDF(
                                                                              context);
                                                                    }
                                                                    if (mounted) {
                                                                      await pdfGenerator
                                                                          .savePDF(
                                                                              context);
                                                                    }
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          false;
                                                                    });

                                                                    print(
                                                                        "print ID: $docID");
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .print),
                                                                ),
                                                                // EDIT BUTTON
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          true;
                                                                    });
                                                                    print(
                                                                        "edit ID: $docID");
                                                                    formFieldService
                                                                            .isEditing =
                                                                        true;
                                                                    print(formFieldService
                                                                        .isEditing);
                                                                    await _cloneDataWithDocID(
                                                                        docID:
                                                                            docID);
                                                                    if (mounted) {
                                                                      dialogService
                                                                          .openDialogBox(
                                                                        context,
                                                                        RegistrationFormPage(
                                                                          documentID:
                                                                              docID,
                                                                        ),
                                                                      );
                                                                    }
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          false;
                                                                    });
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .edit),
                                                                ),
                                                                // DELETE BUTTON
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          true;
                                                                    });
                                                                    print(
                                                                        "delete ID: $docID");
                                                                    await database
                                                                        .deteteApplicants(
                                                                            docID);
                                                                    setState(
                                                                        () {
                                                                      _isProcessing =
                                                                          false;
                                                                    });
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .delete),
                                                                ),
                                                              ],
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return const Text(
                                            "No applicants yet, try adding a new applicant");
                                      }
                                    }),
                              ],
                            ),
                          ),
                          // for pricing
                          const SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /////////////////// TEST SCHOOL FEE TABLE UI /////////////////
                                  CardSchoolFeeTable(),
                                ],
                              ),
                            ),
                          ),
                          // for FAQ

                          const CardFAQ(),
                          //const ParentalAgreementPage(),
                          /* SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text('FAQ page...'),
                                ElevatedButton(
                                  onPressed: () {
                                    //openNoteBox();
                                  },
                                  child: const Text("open dialog box"),
                                ),
                              ],
                            ),
                          ),*/
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
