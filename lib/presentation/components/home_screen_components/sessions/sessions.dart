import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/presentation/components/home_screen_components/sessions/student_view_table.dart';
import 'package:stap_admin/presentation/components/home_screen_components/sessions/teacher_view_table.dart';
// import 'package:pdf/pdf.dart';
// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;

class Sessions extends StatefulWidget {
  const Sessions({super.key});

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  bool isStudentView = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: meta.colorPallet.primary700,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (!isStudentView) {
                          isStudentView = !isStudentView;
                        }
                      });
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: isStudentView
                            ? meta.colorPallet.primary500
                            : meta.colorPallet.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Student view',
                          style: TextStyle(color: meta.colorPallet.pureWhite),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isStudentView) {
                          isStudentView = !isStudentView;
                        }
                      });
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: isStudentView
                            ? meta.colorPallet.transparent
                            : meta.colorPallet.primary500,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Teacher view',
                          style: TextStyle(color: meta.colorPallet.pureWhite),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          (isStudentView)
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: StudentViewTable(),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: TeacherViewTable(),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: meta.colorPallet.primary700,
                fixedSize: const Size(double.maxFinite, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Save changes',
                    style: TextStyle(color: meta.colorPallet.pureWhite),
                  ),
                  // Icon(
                  //   Icons.double_arrow_sharp,
                  //   color: meta.colorPallet.pureWhite,
                  // )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ElevatedButton(
              onPressed: () async {
                // final pdf = pw.Document();
                // pdf.addPage(
                //   pw.Page(
                //     build: (pw.Context context) => pw.Center(
                //       child: pw.Container(
                //           width: 100, height: 100, color: PdfColors.amber),
                //     ),
                //   ),
                // );
                // print(Directory.systemTemp);
                // final file = File(
                //     '/data/user/0/com.example.stap_admin/code_cache/example.pdf');
                // await file.writeAsBytes(await pdf.save());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: meta.colorPallet.grey300,
                fixedSize: const Size(double.maxFinite, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Export as PDF',
                    style: TextStyle(color: meta.colorPallet.pureWhite),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'You can export the above tabla as a PDF file',
            style: TextStyle(color: meta.colorPallet.grey300),
          ),
          Text(
            'so you can print it and use it.',
            style: TextStyle(color: meta.colorPallet.grey300),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
