import 'package:flutter/material.dart';
import 'package:mald_registration_app02/ui/my_card_ui.dart';

class CardSchoolFeeTable extends StatefulWidget {
  const CardSchoolFeeTable({super.key});

  @override
  State<CardSchoolFeeTable> createState() => _CardSchoolFeeTableState();
}

class _CardSchoolFeeTableState extends State<CardSchoolFeeTable> {
  @override
  Widget build(BuildContext context) {
    return MyCardUi(
      cardAgree: false,
      cardName: "SCHOOL FEE",
      inCardWidget1: const SizedBox(height: 0),
      inCardWidget2: const SizedBox(height: 0),
      cardWidgets: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              const Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                "SIBLINGS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "NON-SIBLINGS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "CAPITAL LEVY",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "20,000.00",
                textAlign: TextAlign.center,
              ),
              const Text(
                "40,000.00",
                textAlign: TextAlign.center,
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "YEARLY TUITION FEE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "104,000.00",
                textAlign: TextAlign.center,
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: const [
            TableRow(children: [
              Text(
                "",
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "QUARTERLY PAYMENT SCHEDULE DUE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            const TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey),
                children: [
                  Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "TRIMESTER 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "SIBLINGS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              const Text(
                "NEW PARENTS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1),
                children: [
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "Date depends on parents ragistration time",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "34,667 +20,000 = 54,667.00",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              const Text(
                "EXISTING PARENTS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1),
                columnWidths: const {
                  0: FractionColumnWidth(0.2),
                },
                children: [
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "June 1 - 15, 2024",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "34,667 +20,000 = 54,667.00",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "NON-SIBLINGS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              const Text(
                "NEW PARENTS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1),
                children: [
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "Date depends on parents ragistration time",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "34,667 +40,000 = 74,667.00",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(children: [
              const Text(
                "EXISTING PARENTS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1),
                columnWidths: const {
                  0: FractionColumnWidth(0.2),
                },
                children: [
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "June 1 - 15, 2024",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: const Text(
                        "34,667.00",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            const TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey),
                children: [
                  Text(
                    "",
                    textAlign: TextAlign.center,
                  ),
                ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "TRIMESTER 2",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            TableRow(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 1))),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "December 1 - 15, 2024",
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 1))),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "34,667.00",
                  textAlign: TextAlign.center,
                ),
              ),
            ])
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            const TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey),
                children: [
                  Text(
                    "",
                    textAlign: TextAlign.center,
                  ),
                ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "TRIMESTER 3",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 1),
          children: [
            TableRow(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 1))),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "March 1 - 15, 2025",
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 1))),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                ),
                child: const Text(
                  "34,667.00",
                  textAlign: TextAlign.center,
                ),
              ),
            ])
          ],
        ),
      ],
    );
  }
}
