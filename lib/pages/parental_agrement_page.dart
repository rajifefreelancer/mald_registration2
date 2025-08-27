import 'package:flutter/material.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';
import 'package:mald_registration_app02/widgets/my_button_widget.dart';
import 'package:provider/provider.dart';

class ParentalAgreementPage extends StatefulWidget {
  const ParentalAgreementPage({super.key});

  @override
  State<ParentalAgreementPage> createState() => _ParentalAgreementPageState();
}

class _ParentalAgreementPageState extends State<ParentalAgreementPage> {
  @override
  Widget build(BuildContext context) {
    final formFieldService = Provider.of<FormFieldService>(context);

    return MyCardUi(
      cardAgree: true,
      cardName: "PARENTAL AGREEMENT", //"READ EVERYTHING BEFORE AGREEING",
      inCardWidget1: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1),
                columnWidths: const {
                  1: FixedColumnWidth(50),
                },
                children: [
                  const TableRow(
                    children: [
                      Text(
                        "AGREEMENT",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Y/N",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I agree with the MALD School's enrollment policy which states that my child (ren)'s grade level placement corresponds to my child(ren)'s age level\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "The age levels that corresponds to the respective grade levels are indicated at the first page of the MALD Schools' Application for Enrollment form.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I give permission for my child(ren) to go on curriculum related class/school field trips in order to take advantage of  what is learnt in class.\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "I understand that prior to each field trip parents will receive notification about the field trip. If the parents do not want their child(ren) to participate in such a one-day out of school event or field trip, they should inform the office or the organizing teacher in a written form prior to the event/field trip date.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "I grant permission for MALD to use my ",
                            ),
                            TextSpan(
                              text: "child(ren)'s photos ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "(unnamed) in school publications, website or other promotional materials.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "I authorize MALD to conduct ",
                            ),
                            TextSpan(
                              text: "educational testing/assessment ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "as needed for the application and placement process. For  a child with a special need, I agree to bring assessment report from the MALD School suggested and selected center.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "I understand that if ",
                            ),
                            TextSpan(
                              text: "complete and accurate information ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "has not been provided during the admission process, MALD may be unable to provide services as needed by the student and, in certain circumstances, may withdraw its offer of admission or terminate the enrollment of the student.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I understand that the admission process is complete only upon complementation of the MALD School’s Application for Enrollment Form, presentation of the copies of the documents that are requested, the parents signing on this ",
                            ),
                            TextSpan(
                              text: "Parents Agreement ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "and upon payment of all applicable fees.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I understand that schools are not accident proof and if any accident happens to my child, I will reimburse or pay the necessary amount to a clinic/hospital that the school took my child to.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I fully agree to abide to MALD rules and procedures.  In case of any grievance, I commit myself to be transparent and come to present my complaint to the office other than talking to other parents about the complaint.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "In the event that the services of a physician are needed, when I am not available, I authorize the school to take my child to the respective branch's nearby selected health institutions - Bloom Clinic and Pomi Clinic (for CMC area Campus)  Suisse Clinic and Brook Clinic (for Vatican and Abo area). I promise to settle the fee that is submitted to me from the school.",
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "I fully agree to make my child assessed by professionals if the school believed that he has an issue to be addressed. If the assessment result confirms he has an issue (Special Needs), I understand the school has a quota to accept my child and if accepted, I also agree to pay a one-to-one support person ",
                            ),
                            TextSpan(
                              text:
                                  "based on the rate specified by the school at the beginning of the academic year.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                      ),
                      const Text(
                        "YES",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      inCardWidget2: const Text(
          ""), /*Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
                borderRadius: 4.0,
                onPressed: () {
                  formFieldService.iAgree = true;
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                buttonChild: const Text("I Agree",
                    style: TextStyle(color: Colors.white))),
            MyButton(
                borderRadius: 4.0,
                onPressed: () async {
                  formFieldService.iAgree = false;
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                buttonChild: const Text("I don't Agree",
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),*/
    );
  }
}
