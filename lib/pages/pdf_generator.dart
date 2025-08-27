import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_pdf_UI/my_pdf_ui.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

class PDFGenerator {
  final pdf = pw.Document();

  Future<void> generatePDF(BuildContext context) async {
    final fFs = Provider.of<FormFieldService>(context, listen: false);
    final img = await rootBundle.load('assets/images/MALD_LOGO_1.png');
    final imageBytes = img.buffer.asUint8List();
    final fontRegular = await PdfGoogleFonts.nunitoLight();
    final fontItalic = await PdfGoogleFonts.nunitoLightItalic();
    final fontBold = await PdfGoogleFonts.nunitoSemiBold();
    double h1 = 16.0;
    //double h2 = 14.0;
    double h3 = 12.0;
    double h4 = 10.0;
    pdf.addPage(
      pw.MultiPage(
        footer: (context) => pw.Column(children: [
          pw.Center(
              child: pw.Text(
                  "Addis Ababa, Ethiopia CMC Campus +251-968197141: +251-908174505 Abo Campus +251-911130184: +251-908174205: Vatican Campus +251-993639903: +251-911130184\nE-Mail: maldeducationethiopia@gmail.com   www.maldeducationethiopia.com",
                  //style: const pw.TextStyle(fontSize: 8.0),
                  textAlign: pw.TextAlign.center)),
          pw.Text(
              "Page ${context.pageNumber} of ${context.pagesCount} - (${fFs.childName.text.trim().toUpperCase()})",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
        ]),
        margin: const pw.EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
            //lineSpacing: 1,
            fontSize: 8.0,
            font: fontRegular,
          ),
        ),
        build: (context) {
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(
                      pw.MemoryImage(imageBytes),
                      width: 80,
                      height: 80,
                    ),
                    pw.SizedBox(width: 10),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: pw.TextStyle(
                          font: fontBold,
                          height: 1.4,
                          fontSize: 25,
                        ),
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: "MALD SCHOOL\n",
                            style: pw.TextStyle(font: fontBold, fontSize: 20),
                          ),
                          pw.TextSpan(
                            text: "APPLICATION FOR\nENROLLMENT\n",
                            style: pw.TextStyle(font: fontBold, fontSize: 20),
                          ),
                          pw.TextSpan(
                            text:
                                "${DateTime.now().year}/${DateTime.now().year + 1}",
                            style: pw.TextStyle(font: fontBold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 30),
                    pw.Container(
                        padding: const pw.EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            width: 2,
                            color: PdfColors.black,
                          ),
                        ),
                        child: pw.Center(
                          child: pw.Text(
                            "Please glue the parents’ photo here",
                            style: pw.TextStyle(font: fontBold),
                            textAlign: pw.TextAlign.center,
                          ),
                        )),
                    pw.SizedBox(width: 20),
                    pw.Container(
                        padding: const pw.EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            width: 2,
                            color: PdfColors.black,
                          ),
                        ),
                        child: pw.Center(
                          child: pw.Text(
                            "Please glue the student’s photo here",
                            style: pw.TextStyle(font: fontBold),
                            textAlign: pw.TextAlign.center,
                          ),
                        )),
                  ],
                ),
                pw.SizedBox(height: 25),
                pw.Center(
                  child: pw.Text("I. PERSONAL DATA",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                ),
                pw.Center(
                  child: pw.Text("a) Information about the child and Family",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 2.5),
                pw.Center(
                  child: pw.Text(
                    "${fFs.childName.text.trim().toUpperCase()} ${fFs.childGFatherName.text.trim().toUpperCase()}",
                    style: pw.TextStyle(font: fontBold, fontSize: h1),
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Center(
                  child: pw.Text(
                      "${fFs.applyTo.toUpperCase()} ______________________",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                ),
                pw.SizedBox(
                  width: 500,
                  child: pw.Text(
                    "(If the true age of the child does not match their assigned level,\nwe reserve the rights to move the child to the appropriate class.)",
                    style: pw.TextStyle(font: fontItalic),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text:
                          "Would you consider a different grade/year if initial choice was full?: ",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.differentGrade.toUpperCase(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
                MyPdfUi().mytable(
                  "Gender: ",
                  "Date of birth (D/M/Y): ",
                  fFs.gender.toUpperCase(),
                  fFs.dateOfBirth.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Citizenship: ",
                  "Exact Age by Aug. 30: \n",
                  fFs.childCitizenship.text.trim().toUpperCase(),
                  fFs.ageOnAugust.text.trim().toUpperCase(),
                  fontRegular,
                  fontBold,
                ),
                pw.SizedBox(height: 5),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text: "Family Status: ",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.maritalStatus.toUpperCase(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
                fFs.maritalStatus == "Divorced"
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                            pw.Text("If divorced, who has legal custody?:\n"),
                            pw.Divider(
                                height: 10,
                                thickness: 0.5,
                                color: PdfColors.grey),
                            MyPdfUi().mytable(
                              "Name: ",
                              "Is the child to be released to either parent?: ",
                              fFs.divorcedName.text.trim().toUpperCase(),
                              fFs.childRelease.toUpperCase(),
                              fontRegular,
                              fontBold,
                            ),
                            MyPdfUi().mytable(
                              "Relationship: ",
                              "Copies of any custody agreements, court orders, and restraining orders pertaining to the child? If yes, please attach the copies: ",
                              fFs.divorcedRelationship.text.trim(),
                              fFs.custodyCopies.toUpperCase(),
                              fontRegular,
                              fontBold,
                            ),
                          ])
                    : pw.SizedBox(height: 0),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text("b) Contact Details",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 1.5),
                MyPdfUi().mytable(
                  "",
                  "",
                  "Family's  Residence",
                  "Emergency contact if parents/guardians are out of reach:  Name, relation, phone number",
                  fontRegular,
                  fontBold,
                ),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                MyPdfUi().mytable(
                  "Home area commonly known as: ",
                  "Name: ",
                  fFs.childArea.text.trim(),
                  fFs.emergencyName.text.trim().toUpperCase(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Sub-city: ",
                  "Relation to the child: ",
                  fFs.childSubCity.text.trim(),
                  fFs.emergencyChildRelation.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "House No.: ",
                  "Phone Number(Ethiopian): ",
                  fFs.childHouseNo.text.trim(),
                  fFs.emergencyPhoneNo.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Center(
                      child: pw.Text("c) Family Data",
                          style: pw.TextStyle(font: fontBold, fontSize: h4)),
                    ),
                    pw.Divider(
                        height: 15, color: PdfColors.black, thickness: 1.5),
                    MyPdfUi().mytable(
                      "",
                      "",
                      "Father's Details",
                      "Mother's Details",
                      fontRegular,
                      fontBold,
                    ),
                    pw.Divider(
                        height: 10, thickness: 0.5, color: PdfColors.grey),
                    MyPdfUi().mytable(
                      "First Name: ",
                      "First Name: ",
                      fFs.fatherFirstName.text.trim().toUpperCase(),
                      fFs.motherFirstName.text.trim().toUpperCase(),
                      fontRegular,
                      fontBold,
                    ),
                    MyPdfUi().mytable(
                      "Father's Name: ",
                      "Father's Name: ",
                      fFs.fatherFatherName.text.trim().toUpperCase(),
                      fFs.motherFatherName.text.trim().toUpperCase(),
                      fontRegular,
                      fontBold,
                    ),
                  ],
                ),
                MyPdfUi().mytable(
                  "Citizenship: ",
                  "Citizenship: ",
                  fFs.fatherCitizenship.text.trim().toUpperCase(),
                  fFs.motherCitizenship.text.trim().toUpperCase(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Father's employer/name of the company: \n",
                  "Mother's employer/name of the company: \n",
                  fFs.fatherEmployer.text.trim(),
                  fFs.motherEmployer.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Father's job title: ",
                  "Mother's job title: ",
                  fFs.fatherJobTitle.text.trim(),
                  fFs.motherJobTitle.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "E-mail address: ",
                  "E-mail address: ",
                  fFs.fatherEmail.text.trim().toUpperCase(),
                  fFs.motherEmail.text.trim().toUpperCase(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Mobile telephone (Ethiopian): ",
                  "Mobile telephone (Ethiopian): ",
                  fFs.fatherMobileTel.text.trim(),
                  fFs.motherMobileTel.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Work Telephone  (for emergency only)-(Ethiopian): \n",
                  "Work Telephone  (for emergency only)-(Ethiopian): \n",
                  fFs.fatherWorkTel.text.trim(),
                  fFs.motherWorkTel.text.trim(),
                  fontRegular,
                  fontBold,
                ),
                pw.SizedBox(height: 5),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      MyPdfUi().mytable(
                        "",
                        "",
                        "Siblings/Step Siblings",
                        "",
                        fontRegular,
                        fontBold,
                      ),
                      pw.Divider(
                          height: 10, thickness: 0.5, color: PdfColors.grey),
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                            text:
                                "Age of other children in the family: (If nun write 0): ",
                            style: pw.TextStyle(font: fontRegular),
                          ),
                          pw.TextSpan(
                            text: fFs.siblingsAge.text.trim(),
                            style: pw.TextStyle(font: fontBold),
                          ),
                        ]),
                      ),
                    ]),
                pw.SizedBox(height: 5),
                MyPdfUi().mytable(
                  "",
                  "",
                  "Other Family Informations",
                  "",
                  fontRegular,
                  fontBold,
                ),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                MyPdfUi().mytable(
                  "Language(s) regularly spoken at home: \n",
                  "In what language does your child read at home?: \n",
                  fFs.familyRegularlySpoken.text.trim().toUpperCase(),
                  fFs.familyReadingLanguage.text.trim().toUpperCase(),
                  fontRegular,
                  fontBold,
                ),
                MyPdfUi().mytable(
                  "Are there others who take care of your child on a regular basis?: \n",
                  "",
                  fFs.familyOthersWhoTakeCare.toUpperCase(),
                  "",
                  fontRegular,
                  fontBold,
                ),
                fFs.familyOthersWhoTakeCare == "Yes"
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                            pw.Text("^ If YES please specify"),
                            pw.Divider(
                                height: 10,
                                thickness: 0.5,
                                color: PdfColors.grey),
                            MyPdfUi().mytable(
                              "Name: ",
                              "How often?: ",
                              fFs.familyOtherCareName.text.trim().toUpperCase(),
                              fFs.familyCareHowOften.text.trim(),
                              fontRegular,
                              fontBold,
                            ),
                          ])
                    : pw.SizedBox(height: 0),
                pw.SizedBox(height: 25),
                pw.Center(
                  child: pw.Text(
                      "II. PREVIOUS SCHOOL AND DEVELOPMENTAL INFORMATION",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                ),
                pw.Center(
                  child: pw.Text("a) Previous school information",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 2.5),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    MyPdfUi().myYNTable(
                      title1: "Has the child ever atended another school: ",
                      data1: fFs.otherSchoolAtend.toUpperCase(),
                      title2: "",
                      data2: "",
                      fontBold: fontBold,
                    ),
                    fFs.otherSchoolAtend == "Yes"
                        ? pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                                pw.Text("^ If YES please specify"),
                                pw.Divider(
                                    height: 10,
                                    thickness: 0.5,
                                    color: PdfColors.black),
                              ])
                        : pw.SizedBox(height: 0),
                  ],
                ),
                fFs.otherSchoolAtend == "Yes"
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "School Name: ",
                            data1:
                                fFs.otherSchoolName.text.trim().toUpperCase(),
                            title2: "School Address: ",
                            data2: fFs.otherSchoolAddress.text.trim(),
                            fontBold: fontBold,
                          ),
                          MyPdfUi().myYNTable(
                            title1: "Grade Level: ",
                            data1: fFs.otherSchoolGradeLevel.text
                                .trim()
                                .toUpperCase(),
                            title2: "",
                            data2: "",
                            fontBold: fontBold,
                          ),
                        ],
                      )
                    : pw.SizedBox(height: 0),
                ////////////////
                fFs.otherSchoolAtend == "Yes"
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          fFs.checkApplyToData == "pre"
                              ? pw.SizedBox(height: 0)
                              : pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    MyPdfUi().myYNTable(
                                      title1:
                                          "Has your child ever been suspended, expelled or subject to serious discipline by a school as a result of his/her behavior or academic performance?: \n",
                                      data1: fFs.otherSchoolDisciplineAction
                                          .toUpperCase(),
                                      check1: "YES",
                                      checkdata1: fFs
                                          .otherSchoolDisciplineActionYes.text
                                          .trim(),
                                      title2:
                                          "Has your child ever been home-schooled?: ",
                                      data2: fFs.otherSchoolHomeSchooled
                                          .toUpperCase(),
                                      check2: "YES",
                                      checkdata2: fFs
                                          .otherSchoolHomeSchooledYes.text
                                          .trim(),
                                      fontBold: fontBold,
                                    ),
                                  ],
                                ),
                        ],
                      )
                    : pw.SizedBox(height: 0),
                fFs.otherSchoolAtend == "Yes"
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 10),
                          pw.RichText(
                            text: pw.TextSpan(children: <pw.TextSpan>[
                              pw.TextSpan(
                                text:
                                    "Has the child been studying any foreign language at school? please specify: ",
                                style: pw.TextStyle(font: fontRegular),
                              ),
                              pw.TextSpan(
                                text: fFs.otherSchoolForeignLanguage
                                    .toUpperCase(),
                                style: pw.TextStyle(font: fontBold),
                              ),
                            ]),
                          ),
                          fFs.otherSchoolForeignLanguage.toUpperCase() == "YES"
                              ? pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(height: 5),
                                    pw.Text("^ If Yes please specify"),
                                    pw.Divider(
                                        height: 10,
                                        thickness: 0.5,
                                        color: PdfColors.grey),
                                    MyPdfUi().myYNTable(
                                      title1: "Language: \n",
                                      data1: fFs.otherSchoolLanguage.text
                                          .trim()
                                          .toUpperCase(),
                                      title2: "How many years: \n",
                                      data2: fFs.otherSchoolLanguageYears.text
                                          .trim(),
                                      fontBold: fontBold,
                                    )
                                  ],
                                )
                              : pw.SizedBox(height: 0),
                          MyPdfUi().myYNTable(
                            title1: "May we contact the school?: ",
                            data1: fFs.otherSchoolMayContact.toUpperCase(),
                            check1: "NO",
                            checkdata1: fFs.otherSchoolMayContactNo.text.trim(),
                            title2:
                                "Has the child ever been enrolled in any type of Special Education program (e.g. gifted and talented program, learning difference/disability, speech therapy or had a one-on-one teacher)?: ",
                            data2:
                                fFs.otherSchoolSpecialEducation.toUpperCase(),
                            check2: "YES",
                            checkdata2:
                                fFs.otherSchoolSpecialEducationYes.text.trim(),
                            fontBold: fontBold,
                          ),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: pw.TextSpan(children: <pw.TextSpan>[
                              pw.TextSpan(
                                text:
                                    "Why did your child leave the school?: \n",
                                style: pw.TextStyle(font: fontRegular),
                              ),
                              pw.TextSpan(
                                text: fFs.otherSchoolWhyLeave.text.trim(),
                                style: pw.TextStyle(font: fontBold),
                              ),
                            ]),
                          ),
                        ],
                      )
                    : pw.SizedBox(height: 0),
                ////////////// FOR DEVELOPMENTAL INFO
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text("b) Developmental information",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 2.5),
                pw.Center(
                  child: pw.Text(
                      "N.B. MALD is not a therapy center and hence, if your child has any developmental delays, your child will be required to pass through a formal assessment that should be done by the MALD suggested assessment center. We only give the opportunity on the first- come first -served basis for few children with special needs as there is limited space in a class.",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 1.5),

                /// for emotional
                pw.SizedBox(height: 5),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Emotional", style: pw.TextStyle(font: fontBold)),
                    pw.Divider(
                        height: 10, thickness: 0.5, color: PdfColors.grey),
                    MyPdfUi().myYNTable(
                      title1:
                          "Is your child willing to share with others and takes turns?: ",
                      data1: fFs.devShareWithOthers!.toUpperCase(),
                      check1: "NO",
                      checkdata1: fFs.devShareWithOthersNo.text.trim(),
                      title2:
                          "Is your child willing to participate in a group?: ",
                      data2: fFs.devParticipateInAGroup!.toUpperCase(),
                      check2: "NO",
                      checkdata2: fFs.devParticipateInAGroupNo.text.trim(),
                      fontBold: fontBold,
                    ),
                  ],
                ),
                MyPdfUi().myYNTable(
                  title1: "Does your child regulate emotions?: ",
                  data1: fFs.devRegulateEmotions!.toUpperCase(),
                  title2: "Does your child show concern for others?: ",
                  data2: fFs.devConcernForOthers!.toUpperCase(),
                  fontBold: fontBold,
                ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Is your child emotionally matured?: ",
                            data1: fFs.devEmotionallyMatured!.toUpperCase(),
                            title2: "Does your child relate with peers?: ",
                            data2: fFs.devRelateWithPeers!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                          MyPdfUi().myYNTable(
                            title1:
                                "Does your child have relationship with adults?: ",
                            data1: fFs.devRelationshipWithAdults!.toUpperCase(),
                            title2: "",
                            data2: "",
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                //// for learning capacity
                pw.SizedBox(height: 5),
                pw.Text("Learning Capacity",
                    style: pw.TextStyle(font: fontBold)),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                MyPdfUi().myYNTable(
                  title1: "Is your child curious?: ",
                  data1: fFs.devIsCurious!.toUpperCase(),
                  title2: "Does your child persevere?: ",
                  data2: fFs.devPersevere!.toUpperCase(),
                  fontBold: fontBold,
                ),
                MyPdfUi().myYNTable(
                  title1: "Does your child work independently?: ",
                  data1: fFs.devWorkIndependently!.toUpperCase(),
                  title2: "Can your child focus on one task at a time?: ",
                  data2: fFs.devFocusOnOneTask!.toUpperCase(),
                  fontBold: fontBold,
                ),
                MyPdfUi().myYNTable(
                  title1:
                      "Does your child have the ability to communicate ideas?: ",
                  data1: fFs.devCommunicateIdeas!.toUpperCase(),
                  title2: "Does your child have critical thinking skills?: ",
                  data2: fFs.devCriticalThinking!.toUpperCase(),
                  fontBold: fontBold,
                ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text("Physical/Self Help",
                              style: pw.TextStyle(font: fontBold)),
                          pw.Divider(
                              height: 10,
                              thickness: 0.5,
                              color: PdfColors.grey),
                          MyPdfUi().myYNTable(
                            title1:
                                "Is your child toilet-trained? \n^ Child is not toilet trained if he/she uses diapers in the daytime.: ",
                            data1: fFs.devToiletTrained!.toUpperCase(),
                            title2:
                                "Can your child feed him/herself? \n^ We expect a child to feed himself/herself in a given time.: ",
                            data2: fFs.devFeedThemselves!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Can your child dress him/herself?: ",
                            data1: fFs.devDressThemselves!.toUpperCase(),
                            title2:
                                "Can your child wash hands by him/herself?: ",
                            data2: fFs.devWashHandsByThemselves!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Does your child play 'Pretend' dress up or play act?: ",
                            data1: fFs.devPlayPretend!.toUpperCase(),
                            title2: "",
                            data2: "",
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text(
                              "Does your child know any of the following about himself/herself?: ",
                              style: pw.TextStyle(font: fontBold)),
                          pw.Divider(
                              height: 10,
                              thickness: 0.5,
                              color: PdfColors.grey),
                          MyPdfUi().myYNTable(
                            title1: "His/her name?: ",
                            data1: fFs.devKnowTheirName!.toUpperCase(),
                            title2: "Father's name?: ",
                            data2: fFs.devKnowFatherName!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Mother's name?: ",
                            data1: fFs.devKnowMotherName!.toUpperCase(),
                            title2: "Gender?: ",
                            data2: fFs.devKnowGender!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Age?: ",
                            data1: fFs.devKnowAge!.toUpperCase(),
                            title2: "",
                            data2: "",
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text(
                              "As far as you know/remember at what age did your child first: ",
                              style: pw.TextStyle(font: fontBold)),
                          pw.Divider(
                              height: 10,
                              thickness: 0.5,
                              color: PdfColors.grey),
                          MyPdfUi().myYNTable(
                            title1: "Sit alone: ",
                            data1: fFs.devSitAlone.text.trim(),
                            title2: "Walk alone: ",
                            data2: fFs.devWalkAlone.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Say single words: ",
                            data1: fFs.devSaySingleWords.text.trim(),
                            title2: "Speak sentences: ",
                            data2: fFs.devSpeakSentences.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Hold own cup: ",
                            data1: fFs.devHoldOwnCup.text.trim(),
                            title2: "Feed self with spoon: ",
                            data2: fFs.devFeedSelfWithSpoon.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                pw.SizedBox(height: 5),
                pw.Text("Speech and Communication: ",
                    style: pw.TextStyle(font: fontBold)),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                fFs.checkApplyToData == "pre"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Is your child able to speak in their primary language?: ",
                            data1: fFs.devSpeakPrimaryLanguage!.toUpperCase(),
                            check1: "NO",
                            checkdata1:
                                fFs.devSpeakPrimaryLanguageNo.text.trim(),
                            title2:
                                "Is your child afraid to speak in front of the public?: ",
                            data2: fFs.devAfraidSpeakPublic!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Is your child able to speak most sounds correctly in their primary language?: ",
                            data1: fFs.devSpeakSoundsPrimaryLanguage!
                                .toUpperCase(),
                            title2: "Is your child afraid to speak?: ",
                            data2: fFs.devAfraidToSpeak!.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Does your child make eye contact when you speak to them?: ",
                            data1: fFs.devEyeContactSpeak!.toUpperCase(),
                            check1: "NO",
                            checkdata1: fFs.devEyeContactSpeakNo.text.trim(),
                            title2:
                                "Does your child usually follow directions?: ",
                            data2: fFs.devFollowDirections!.toUpperCase(),
                            check2: "NO",
                            checkdata2: fFs.devFollowDirectionsNo.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Can your child follow 2 or 3 different sequential instructions?: ",
                            data1: fFs.devDifferentInstructions!.toUpperCase(),
                            check1: "NO",
                            checkdata1:
                                fFs.devDifferentInstructionsNo.text.trim(),
                            title2:
                                "can other people or a person unfamiliar with his/her speech understand most of what the child say?: ",
                            data2: fFs.devSpeechUnderstandable!.toUpperCase(),
                            check2: "NO",
                            checkdata2:
                                fFs.devSpeechUnderstandableNo.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                MyPdfUi().myYNTable(
                  title1: "Does your child have a very short attention span?: ",
                  data1: fFs.devShortAttentionSpan!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devShortAttentionSpanYes.text.trim(),
                  title2: "",
                  data2: "",
                  fontBold: fontBold,
                ),
                //////////////////////////////////////////
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 10),
                          pw.Text(
                              "How does the child communicate his or her wants and needs?(Select all that apply)\n(Yes) (Sometimes) (Not_yet) (No): ",
                              style: pw.TextStyle(font: fontBold)),
                          pw.Divider(
                              height: 10,
                              thickness: 0.5,
                              color: PdfColors.grey),
                          MyPdfUi().myYNTable(
                            title1: "The child does not make requests: ",
                            data1: fFs.devComNoRequests.toUpperCase(),
                            title2:
                                "Non-verbally with pictures, gestures, signs: ",
                            data2: fFs.devComNonVerbally.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Verbally with sounds or crying: ",
                            data1: fFs.devComVerballySounds.toUpperCase(),
                            title2:
                                "Verbally with single words or short phrases: ",
                            data2: fFs.devComVerballySingleWords.toUpperCase(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1: "Using complete sentences: ",
                            data1: fFs.devComCompleteSentences.toUpperCase(),
                            title2: "",
                            data2: "",
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                // PHYSICAL/EMOTIONAL/MEDICAL CONDITION
                pw.SizedBox(height: 5),
                pw.Text("Physical, Emotional or Medical Condition: ",
                    style: pw.TextStyle(font: fontBold)),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                MyPdfUi().myYNTable(
                  title1:
                      "Does your child require any physical or emotional support as part of his or her learning program (e.g. mobility issues, allergies, recent family changes or personal difficulties)?: ",
                  data1: fFs.devMedRequireSupport!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devMedRequireSupportYes.text.trim(),
                  title2:
                      "Does your child have any dietary restrictions (vegetarian, vegan, gluten free, etc.) or has allergies (dogs, cats, medication, plants, scents, etc.): ",
                  data2: fFs.devMedDietaryRestrictions!.toUpperCase(),
                  check2: "YES",
                  checkdata2: fFs.devMedDietaryRestrictionsYes.text.trim(),
                  fontBold: fontBold,
                ),
                MyPdfUi().myYNTable(
                  title1:
                      "Does your child have a diagnosed medical condition that may require support?: ",
                  data1: fFs.devMedDiagnosedSupport!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devMedDiagnosedSupportYes.text.trim(),
                  title2: "",
                  data2: "",
                  fontBold: fontBold,
                ),
                fFs.checkApplyToData == "pre"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Has your child ever been referred to an educational psychologist?: ",
                            data1: fFs.devMedReferredEduPsychologist!
                                .toUpperCase(),
                            check1: "YES",
                            checkdata1: fFs
                                .devMedReferredEduPsychologistYes.text
                                .trim(),
                            title2:
                                "Has your child ever been diagnosed as having Attention Deficit Disorder?: ",
                            data2: fFs.devMedAttentionDeficit!.toUpperCase(),
                            check2: "YES",
                            checkdata2:
                                fFs.devMedAttentionDeficitYes.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                pw.SizedBox(height: 5),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                        "Has your child ever been diagnosed or has history with any delay or difficulty: ",
                        style: pw.TextStyle(font: fontBold)),
                    pw.Divider(
                        height: 10, thickness: 0.5, color: PdfColors.grey),
                    MyPdfUi().myYNTable(
                      title1: "Learning: ",
                      data1: fFs.devMedDiagnosedLearning!.toUpperCase(),
                      check1: "YES",
                      checkdata1: fFs.devMedDiagnosedLearningYes.text.trim(),
                      title2: "Physical: ",
                      data2: fFs.devMedDiagnosedPhysical!.toUpperCase(),
                      check2: "YES",
                      checkdata2: fFs.devMedDiagnosedPhysicalYes.text.trim(),
                      fontBold: fontBold,
                    ),
                  ],
                ),
                MyPdfUi().myYNTable(
                  title1: "behavioral issues: ",
                  data1: fFs.devMedDiagnosedBehavioral!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devMedDiagnosedBehavioralYes.text.trim(),
                  title2: "Emotional: ",
                  data2: fFs.devMedDiagnosedEmotional!.toUpperCase(),
                  check2: "YES",
                  checkdata2: fFs.devMedDiagnosedEmotionalYes.text.trim(),
                  fontBold: fontBold,
                ),
                MyPdfUi().myYNTable(
                  title1: "Speech problem or Delay: ",
                  data1: fFs.devMedDiagnosedSpeech!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devMedDiagnosedSpeechYes.text.trim(),
                  title2: "Social: ",
                  data2: fFs.devMedDiagnosedSocial!.toUpperCase(),
                  check2: "YES",
                  checkdata2: fFs.devMedDiagnosedSocialYes.text.trim(),
                  fontBold: fontBold,
                ),
                MyPdfUi().myYNTable(
                  title1: "Vision deficit: ",
                  data1: fFs.devMedDiagnosedSeizuresEpilepsy!.toUpperCase(),
                  check1: "YES",
                  checkdata1: fFs.devMedDiagnosedVisionYes.text.trim(),
                  title2: "Seizures/Epilepsy: ",
                  data2: fFs.devMedDiagnosedSocial!.toUpperCase(),
                  check2: "YES",
                  checkdata2:
                      fFs.devMedDiagnosedSeizuresEpilepsyYes.text.trim(),
                  fontBold: fontBold,
                ),
                pw.SizedBox(height: 10),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text: "Any other disability: ",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.devMedDiagnosedOther.text.trim(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                    "Describe your child (temperament, personality, interest, abilities): ",
                    style: pw.TextStyle(font: fontBold)),
                pw.Divider(height: 10, thickness: 0.5, color: PdfColors.grey),
                fFs.checkApplyToData == "pre"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "What is your child's most favorite subject?: ",
                            data1: fFs.devMostFavoriteSubject.text.trim(),
                            title2:
                                "What is your child's least favorite subject?: ",
                            data2: fFs.devLeastFavoriteSubject.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                fFs.checkApplyToData == "other"
                    ? pw.SizedBox(height: 0)
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          MyPdfUi().myYNTable(
                            title1:
                                "Describe your child's favorite toys or activities: ",
                            data1: fFs.devFavoriteToys.text.trim(),
                            title2:
                                "Describe any activities your child avoids: ",
                            data2: fFs.devActivityAvoids.text.trim(),
                            fontBold: fontBold,
                          ),
                        ],
                      ),
                MyPdfUi().myYNTable(
                  title1:
                      "Does your child have any special talents or interest in any field?: ",
                  data1: fFs.devSpecialTalents.text.trim(),
                  title2:
                      "Describe any afterschool activities your child like to participate: ",
                  data2: fFs.devAfterschoolActivity.text.trim(),
                  fontBold: fontBold,
                ),
                pw.SizedBox(height: 10),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text: "Use three words to describe your child.: \n",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.devDescribeChild.text.trim(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
                pw.SizedBox(height: 10),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 1),
                pw.Center(
                  child: pw.Text(
                      "MALD Primary School believes in the holistic development of each student and that there is more success when families are actively engaged in the learning process.",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 1),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text:
                          "Give examples of the ways you will support your child's learning.: \n",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.devExampleSupport.text.trim(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
///////////// FOR MORE DETAILS /////
                pw.SizedBox(height: 25),
                pw.Center(
                  child: pw.Text("III. MORE DETAILS AND SCHOOL FEE",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                ),
                //pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text("a) More details",
                      style: pw.TextStyle(font: fontBold, fontSize: h4)),
                ),
                pw.Divider(height: 15, color: PdfColors.black, thickness: 2.5),
                MyPdfUi().myYNTable(
                  title1:
                      "Please indicate where you found out about our school: ",
                  data1: fFs.detailsWhereFoundSchool.text.trim(),
                  title2:
                      "What reasons have determined your choice of MALD Primary School?: ",
                  data2: fFs.detailsWhyChooseSchool.text.trim(),
                  fontBold: fontBold,
                ),
                pw.SizedBox(height: 10),
                pw.RichText(
                  text: pw.TextSpan(children: <pw.TextSpan>[
                    pw.TextSpan(
                      text:
                          "What do you hope that you and your child will gain from MALD Primary School?: \n",
                      style: pw.TextStyle(font: fontRegular),
                    ),
                    pw.TextSpan(
                      text: fFs.detailsHopeToGainInSchool.text.trim(),
                      style: pw.TextStyle(font: fontBold),
                    ),
                  ]),
                ),
/////////////////// for school fee /////////
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Center(
                      child: pw.Text("b) School fee",
                          style: pw.TextStyle(font: fontBold, fontSize: h4)),
                    ),
                    pw.Divider(
                        height: 15, color: PdfColors.black, thickness: 2.5),
                    pw.Center(
                      child: pw.Text(
                          "NOTE: Before the school payment is settled, we will have an interview with both parents/guardians (if both cannot make it, one should be available) and a team of teachers in the school will observe the child and conduct the assessment. The assessment fee is ETB 3,000 for all levels. After the interview and the assessment is completed, the school will notify you parents through telephone if your child is eligible for admission and you will be required to fill out this form and return it with the supporting documents to the office in 3 days. Then payment should be made in 5 days after the acceptance call from the Office. If you fail to do so, we are not forced to keep the spot for your child. Thank you.",
                          style: pw.TextStyle(font: fontBold)),
                    ),
                    pw.Divider(
                        height: 15, color: PdfColors.black, thickness: 1.5),
                  ],
                ),
                pw.Table(
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.3),
                    1: pw.FractionColumnWidth(0.35),
                    2: pw.FractionColumnWidth(0.35),
                  },
                  children: [
                    pw.TableRow(children: [
                      pw.Text(
                        "",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(font: fontBold),
                      ),
                      pw.Text(
                        "SIBLINGS",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(font: fontBold),
                      ),
                      pw.Text(
                        "NON-SIBLINGS",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(font: fontBold),
                      ),
                    ]),
                  ],
                ),
                pw.Table(
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.3),
                    1: pw.FractionColumnWidth(0.35),
                    2: pw.FractionColumnWidth(0.35),
                  },
                  children: [
                    pw.TableRow(children: [
                      pw.Text(
                        "CAPITAL LEVY",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(font: fontBold),
                      ),
                      pw.Text(
                        "20,000.00",
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                        "40,000.00",
                        textAlign: pw.TextAlign.center,
                      ),
                    ]),
                  ],
                ),
                pw.Table(
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.3),
                    1: pw.FractionColumnWidth(0.7),
                  },
                  children: [
                    pw.TableRow(children: [
                      pw.Text(
                        "YEARLY TUITION FEE",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(font: fontBold),
                      ),
                      pw.Text(
                        "104,000.00",
                        textAlign: pw.TextAlign.center,
                      ),
                    ]),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Column(children: [
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {},
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "QUARTERLY PAYMENT SCHEDULE DUE",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                      pw.TableRow(
                          decoration:
                              const pw.BoxDecoration(color: PdfColors.blueGrey),
                          children: [
                            pw.Text(
                              "-",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(font: fontBold),
                            ),
                          ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "TRIMESTER 1",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "SIBLINGS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {
                      0: pw.FractionColumnWidth(0.3),
                      1: pw.FractionColumnWidth(0.7),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "NEW PARENTS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                        pw.Table(
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          border: pw.TableBorder.all(width: 1),
                          columnWidths: const {},
                          children: [
                            pw.TableRow(children: [
                              pw.Text(
                                "Date depends on parents ragistration time",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                            pw.TableRow(children: [
                              pw.Text(
                                "34,667 +20,000 = 54,667.00",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {
                      0: pw.FractionColumnWidth(0.3),
                      1: pw.FractionColumnWidth(0.7),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "EXISTING PARENTS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                        pw.Table(
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          border: pw.TableBorder.all(width: 1),
                          columnWidths: const {
                            0: pw.FractionColumnWidth(0.2),
                          },
                          children: [
                            pw.TableRow(children: [
                              pw.Text(
                                "June 1 - 15, 2024",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                            pw.TableRow(children: [
                              pw.Text(
                                "34,667 +20,000 = 54,667.00",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ]),
                pw.Column(children: [
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {},
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "NON-SIBLINGS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {
                      0: pw.FractionColumnWidth(0.3),
                      1: pw.FractionColumnWidth(0.7),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "NEW PARENTS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                        pw.Table(
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          border: pw.TableBorder.all(width: 1),
                          columnWidths: const {},
                          children: [
                            pw.TableRow(children: [
                              pw.Text(
                                "Date depends on parents ragistration time",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                            pw.TableRow(children: [
                              pw.Text(
                                "34,667 +40,000 = 74,667.00",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {
                      0: pw.FractionColumnWidth(0.3),
                      1: pw.FractionColumnWidth(0.7),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "EXISTING PARENTS",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                        pw.Table(
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          border: pw.TableBorder.all(width: 1),
                          columnWidths: const {
                            0: pw.FractionColumnWidth(0.2),
                          },
                          children: [
                            pw.TableRow(children: [
                              pw.Text(
                                "June 1 - 15, 2024",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                            pw.TableRow(children: [
                              pw.Text(
                                "34,667.00",
                                textAlign: pw.TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ]),
                pw.Column(children: [
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: const {},
                    children: [
                      pw.TableRow(
                          decoration:
                              const pw.BoxDecoration(color: PdfColors.blueGrey),
                          children: [
                            pw.Text(
                              "-",
                              textAlign: pw.TextAlign.center,
                            ),
                          ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "TRIMESTER 2",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "December 1 - 15, 2024",
                          textAlign: pw.TextAlign.center,
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "34,667.00",
                          textAlign: pw.TextAlign.center,
                        ),
                      ])
                    ],
                  ),
                ]),
                pw.Column(children: [
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    children: [
                      pw.TableRow(
                          decoration:
                              const pw.BoxDecoration(color: PdfColors.blueGrey),
                          children: [
                            pw.Text(
                              "-",
                              textAlign: pw.TextAlign.center,
                            ),
                          ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "TRIMESTER 3",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: fontBold),
                        ),
                      ]),
                    ],
                  ),
                  pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    children: [
                      pw.TableRow(children: [
                        pw.Text(
                          "March 1 - 15, 2025",
                          textAlign: pw.TextAlign.center,
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text(
                          "34,667.00",
                          textAlign: pw.TextAlign.center,
                        ),
                      ])
                    ],
                  ),
                ]),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  "N .B For registration to be complete, the capital levy and the first term fee should be paid (i.e. ETB 74,667 for Non-Siblings and ETB 54,667 for siblings). We are using Dashen Bank School System; once your registration is complete all payment will be transferred to the new system from the second trimester on. But the first payment should be made via the below stated account.",
                  style: pw.TextStyle(font: fontBold),
                ),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  "Please transfer the money to our account at DASHEN BANK 0063784698001- under your child's name. Please don't use names other than your child's name as we have difficulties to trace back whose payment is done. Payment is complete when deposit slip is submitted to the office in 5 working days so that we can issue you a receipt accordingly.",
                  style: pw.TextStyle(font: fontBold),
                ),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  "The payment should be made after 5 days of the interview. If you fail to do so, we are not forced to keep the spot for your child. Thank you.",
                  style: pw.TextStyle(font: fontBold),
                ),
                //pw.Divider(height: 15, color: PdfColors.black, thickness: 1.5),

                ///*/
                ///// for parent agriment ////
                pw.SizedBox(height: 25),
                pw.Column(children: [
                  pw.Text("IV. PARENTAL AGREEMENT",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                  pw.Divider(
                      height: 25, color: PdfColors.black, thickness: 2.5),
                ]),
                pw.Table(
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.88),
                    1: pw.FractionColumnWidth(0.12),
                  },
                  children: [
                    pw.TableRow(
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey300),
                      children: [
                        pw.Text(
                          "AGREEMENT",
                          style: pw.TextStyle(font: fontBold),
                          textAlign: pw.TextAlign.center,
                        ),
                        pw.Text(
                          "Y/N",
                          style: pw.TextStyle(font: fontBold),
                          textAlign: pw.TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
                MyPdfUi().myAgreeTable(
                  text1: "",
                  text2:
                      "I agree with the MALD School's enrollment policy which states that my child (ren)'s grade level placement corresponds to my child(ren)'s age level\n",
                  text3:
                      "The age levels that corresponds to the respective grade levels are indicated at the first page of the MALD Schools' Application for Enrollment form.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1: "",
                  text2:
                      "I give permission for my child(ren) to go on curriculum related class/school field trips in order to take advantage of  what is learnt in class.\n",
                  text3:
                      "I understand that prior to each field trip parents will receive notification about the field trip. If the parents do not want their child(ren) to participate in such a one-day out of school event or field trip, they should inform the office or the organizing teacher in a written form prior to the event/field trip date.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1: "I grant permission for MALD to use my ",
                  text2: "child(ren)'s photos ",
                  text3:
                      "(unnamed) in school publications, website or other promotional materials.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1: "I authorize MALD to conduct ",
                  text2: "educational testing/assessment ",
                  text3:
                      "as needed for the application and placement process. For  a child with a special need, I agree to bring assessment report from the MALD School suggested and selected center.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1: "I understand that if ",
                  text2: "complete and accurate information ",
                  text3:
                      "has not been provided during the admission process, MALD may be unable to provide services as needed by the student and, in certain circumstances, may withdraw its offer of admission or terminate the enrollment of the student.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1:
                      "I understand that the admission process is complete only upon complementation of the MALD School's Application for Enrollment Form, presentation of the copies of the documents that are requested, the parents signing on this ",
                  text2: "Parents Agreement ",
                  text3: "and upon payment of all applicable fees.",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1:
                      "I understand that schools are not accident proof and if any accident happens to my child, I will reimburse or pay the necessary amount to a clinic/hospital that the school took my child to.",
                  text2: "",
                  text3: "",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                MyPdfUi().myAgreeTable(
                  text1:
                      "I fully agree to abide to MALD rules and procedures.  In case of any grievance, I commit myself to be transparent and come to present my complaint to the office other than talking to other parents about the complaint.",
                  text2: "",
                  text3: "",
                  fontRegular: fontRegular,
                  fontBold: fontBold,
                ),
                pw.Table(
                  defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.88),
                    1: pw.FractionColumnWidth(0.12),
                  },
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 2.0),
                          child: pw.RichText(
                            text: pw.TextSpan(children: <pw.TextSpan>[
                              pw.TextSpan(
                                text:
                                    "In the event that the services of a physician are needed, when I am not available, I authorize the school to take my child to the respective branch’s nearby selected health institutions - Bloom Clinic and Pomi Clinic (for CMC area Campus)  Suisse Clinic and Brook Clinic (for Vatican and Abo area). I promise to settle the fee that is submitted to me from the school.",
                                style: pw.TextStyle(font: fontRegular),
                              ),
                            ]),
                          ),
                        ),
                        pw.Text(
                          "Please sign here:",
                          textAlign: pw.TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
                pw.Table(
                  defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                  border: pw.TableBorder.all(width: 1),
                  columnWidths: const {
                    0: pw.FractionColumnWidth(0.88),
                    1: pw.FractionColumnWidth(0.12),
                  },
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 2.0),
                          child: pw.RichText(
                            text: pw.TextSpan(children: <pw.TextSpan>[
                              pw.TextSpan(
                                text:
                                    "I fully agree to make my child assessed by professionals if the school believed that he has an issue to be addressed. If the assessment result confirms he has an issue (Special Needs), I understand the school has a quota to accept my child and if accepted, I also agree to pay a one-to-one support person ",
                                style: pw.TextStyle(font: fontRegular),
                              ),
                              pw.TextSpan(
                                text:
                                    "based on the rate specified by the school at the beginning of the academic year.",
                                style: pw.TextStyle(font: fontBold),
                              ),
                            ]),
                          ),
                        ),
                        pw.Text(
                          "Please sign here:",
                          textAlign: pw.TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
                pw.Divider(height: 15),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                            text:
                                "Final acceptance is dependent upon receipt of the items listed below ",
                            style: pw.TextStyle(font: fontBold),
                          ),
                          pw.TextSpan(
                            text: "(please attach these documents):",
                            style: pw.TextStyle(font: fontRegular),
                          ),
                        ]),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 8.0),
                        child: pw.RichText(
                          text: pw.TextSpan(children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: "•	Birth certificate (a copy)\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	Immunization certificate\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	Student Photo x 6 (the smallest size)\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	Previous school Report Card\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	This Registration Form\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	Confidential behavior report (Sealed)\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                            pw.TextSpan(
                              text: "•	Mother and Father Photos (One each)\n",
                              style: pw.TextStyle(font: fontRegular),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                pw.SizedBox(height: 10),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                            text:
                                "By entering our names below, we declare that we have answered all the above questions honestly and that we pledge our cooperation with MALD School in the pursuit of the school's purpose. ",
                            style: pw.TextStyle(font: fontRegular),
                          ),
                          pw.TextSpan(
                            text:
                                "If enrollment is accepted, I agree to pay all fees when due.",
                            style: pw.TextStyle(font: fontBold),
                          ),
                        ]),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "Parents' signature ___________________________________________________________ Date _________________________"),
                    ]),
                pw.SizedBox(height: 15),
                pw.Center(
                  child: pw.Text(
                      "***********************************************************************",
                      style: pw.TextStyle(font: fontBold, fontSize: h3)),
                ),
                ////////// for office use only
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Center(
                      child: pw.Text("FOR OFFICE USE ONLY",
                          style: pw.TextStyle(font: fontBold, fontSize: h3)),
                    ),
                    pw.Center(
                      child: pw.Text("Please do not fill out",
                          style: pw.TextStyle(font: fontItalic, fontSize: h4)),
                    ),
                    pw.Divider(
                        height: 15, color: PdfColors.black, thickness: 2.5),
                  ],
                ),

                pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: {
                      0: const pw.FractionColumnWidth(0.35),
                      1: const pw.FractionColumnWidth(0.35),
                      2: const pw.FractionColumnWidth(0.3),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              width: 20,
                              height: 20,
                            ),
                            pw.SizedBox(width: 10),
                            pw.Text("Accepted"),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              width: 20,
                              height: 20,
                            ),
                            pw.SizedBox(width: 10),
                            pw.Text("Not Accepted"),
                          ],
                        ),
                        pw.Container(
                            padding: const pw.EdgeInsets.all(4.0),
                            //constraints: const pw.BoxConstraints(minHeight: 40.0),
                            child: pw.Text(
                              "Student ID number:\n_________________________",
                              style: const pw.TextStyle(lineSpacing: 3.0),
                            )),
                      ]),
                    ]),
                pw.Table(
                    defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: {
                      0: const pw.FractionColumnWidth(0.35),
                      1: const pw.FractionColumnWidth(0.35),
                      2: const pw.FractionColumnWidth(0.3),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          //constraints: const pw.BoxConstraints(minHeight: 40.0),
                          child: pw.Text(
                            "Provisional grade placement:\n_________________________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          //constraints: const pw.BoxConstraints(minHeight: 40.0),
                          child: pw.Text(
                            "Date of placement Assessment:\n_____/_____/____________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          //constraints: const pw.BoxConstraints(minHeight: 40.0),
                          child: pw.Text(
                            "Date of reporting:\n_____/_____/____________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                      ]),
                    ]),
                pw.Table(
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: {
                      0: const pw.FractionColumnWidth(0.7),
                      1: const pw.FractionColumnWidth(0.3),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          child: pw.Row(children: [
                            pw.Text("Placement paid:"),
                            pw.SizedBox(width: 40),
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              width: 20,
                              height: 20,
                            ),
                            pw.SizedBox(width: 10),
                            pw.Text("YES"),
                            pw.SizedBox(width: 40),
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              width: 20,
                              height: 20,
                            ),
                            pw.SizedBox(width: 10),
                            pw.Text("NO"),
                          ]),
                        ),
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          //constraints: const pw.BoxConstraints(minHeight: 40.0),
                          child: pw.Text(
                            "Date:\n_____/_____/____________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                      ]),
                    ]),
                pw.Table(
                    defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                    border: pw.TableBorder.all(width: 1),
                    columnWidths: {
                      0: const pw.FractionColumnWidth(0.7),
                      1: const pw.FractionColumnWidth(0.3),
                    },
                    children: [
                      pw.TableRow(children: [
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          child: pw.Text(
                            "Admissions Officer:\n__________________________________________________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          child: pw.Text(
                            "Date:\n_____/_____/____________",
                            style: const pw.TextStyle(lineSpacing: 3.0),
                          ),
                        ),
                      ]),
                    ]),

                pw.Table(
                    defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                    border: pw.TableBorder.all(width: 1),
                    children: [
                      pw.TableRow(children: [
                        pw.Container(
                          padding:
                              const pw.EdgeInsets.only(top: 4.0, left: 4.0),
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Documents received:",
                                  style: pw.TextStyle(font: fontRegular),
                                ),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 8.0),
                                  child: pw.RichText(
                                    text: pw.TextSpan(children: <pw.TextSpan>[
                                      pw.TextSpan(
                                        text: "•	Birth certificate\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text: "•	Immunization certificate\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text: "•	Student Photo x 6\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text: "•	Previous school Report Card\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text: "•	This Registration Form\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text:
                                            "•	Confidential behavior report (Sealed)\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                      pw.TextSpan(
                                        text:
                                            "•	Mother and Father Photos (One each)\n",
                                        style: pw.TextStyle(font: fontRegular),
                                      ),
                                    ]),
                                  ),
                                ),
                                pw.Text(
                                  "Comments:_____________________________________________________________",
                                  style: pw.TextStyle(font: fontRegular),
                                ),
                              ]),
                        ),
                      ])
                    ]),

                //Placement paid

                //pw.Divider(height: 15),
/////////////////////////////////////

                pw.SizedBox(
                  height: 20,
                ),
                //pw.Lorem(length: 50),
              ],
            )
          ];
        },
      ),
    );
  }

  Future<void> savePDF(BuildContext context) async {
    final fFs = Provider.of<FormFieldService>(context, listen: false);

    final pdfInBytes = await pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = '${fFs.childName.text.trim().toUpperCase()}.pdf';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.Url.revokeObjectUrl(url);
  }
}
