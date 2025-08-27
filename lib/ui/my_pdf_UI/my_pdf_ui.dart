import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class MyPdfUi {
  pw.Table mytable(String? title1, String? title2, String? data1, String? data2,
      Font? fontRegular, Font? fontBold) {
    return pw.Table(
      defaultColumnWidth: const pw.FractionColumnWidth(.5),
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding:
                  const pw.EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10),
              child: pw.RichText(
                text: pw.TextSpan(children: <pw.TextSpan>[
                  pw.TextSpan(
                    text: title1,
                    style: pw.TextStyle(font: fontRegular),
                  ),
                  pw.TextSpan(
                    text: data1,
                    style: pw.TextStyle(font: fontBold),
                  ),
                ]),
              ),
            ),
            pw.Padding(
              padding:
                  const pw.EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10),
              child: pw.RichText(
                text: pw.TextSpan(children: <pw.TextSpan>[
                  pw.TextSpan(
                    text: title2,
                    style: pw.TextStyle(font: fontRegular),
                  ),
                  pw.TextSpan(
                    text: data2,
                    style: pw.TextStyle(font: fontBold),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Table myYNTable({
    required String? title1,
    required String? data1,
    required String? title2,
    required String? data2,
    String? check1,
    String? check2,
    String checkdata1 = "",
    String checkdata2 = "",
    Font? fontRegular,
    required Font? fontBold,
  }) {
    return pw.Table(
      defaultColumnWidth: const pw.FractionColumnWidth(.5),
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding:
                  const pw.EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.RichText(
                    text: pw.TextSpan(children: <pw.TextSpan>[
                      pw.TextSpan(
                        text: title1,
                        style: pw.TextStyle(font: fontRegular),
                      ),
                      pw.TextSpan(
                        text: data1,
                        style: pw.TextStyle(font: fontBold),
                      ),
                    ]),
                  ),
                  data1 == check1
                      ? pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 4),
                            pw.Text("^ If $check1 please specify"),
                            pw.Divider(
                                height: 10,
                                thickness: 0.5,
                                color: PdfColors.grey),
                            pw.Text(checkdata1,
                                style: pw.TextStyle(font: fontBold))
                          ],
                        )
                      : pw.SizedBox(height: 0),
                ],
              ),
            ),
            pw.Padding(
              padding:
                  const pw.EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.RichText(
                    text: pw.TextSpan(children: <pw.TextSpan>[
                      pw.TextSpan(
                        text: title2,
                        style: pw.TextStyle(font: fontRegular),
                      ),
                      pw.TextSpan(
                        text: data2,
                        style: pw.TextStyle(font: fontBold),
                      ),
                    ]),
                  ),
                  data2 == check2
                      ? pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 4),
                            pw.Text("^ If $check2 please specify"),
                            pw.Divider(
                                height: 10,
                                thickness: 0.5,
                                color: PdfColors.grey),
                            pw.Text(checkdata2,
                                style: pw.TextStyle(font: fontBold))
                          ],
                        )
                      : pw.SizedBox(height: 0),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Table myAgreeTable({
    required String? text1,
    required String? text2,
    required String? text3,
    required Font? fontRegular,
    required Font? fontBold,
  }) {
    return pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      border: pw.TableBorder.all(width: 1),
      columnWidths: const {
        0: pw.FractionColumnWidth(0.88),
        1: pw.FractionColumnWidth(0.12),
      },
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              child: pw.RichText(
                text: pw.TextSpan(children: <pw.TextSpan>[
                  pw.TextSpan(
                    text: text1,
                    style: pw.TextStyle(font: fontRegular),
                  ),
                  pw.TextSpan(
                    text: text2,
                    style: pw.TextStyle(font: fontBold),
                  ),
                  pw.TextSpan(
                    text: text3,
                    style: pw.TextStyle(font: fontRegular),
                  ),
                ]),
              ),
            ),
            pw.Text(
              "YES",
              textAlign: pw.TextAlign.center,
            )
          ],
        ),
      ],
    );
  }
}
