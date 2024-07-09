import 'dart:typed_data';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/screens/branches/contact_screen.dart';

contactAndReport(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
    // backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: meta.colorPallet.pureWhite,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 18, 25, 10),
                  child: Container(
                    width: 80,
                    height: 3,
                    decoration: BoxDecoration(
                        color: meta.colorPallet.pureBlack,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Text(
                  'Report or contact us',
                  style: TextStyle(
                    fontSize: 20,
                    color: meta.colorPallet.pureBlack,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Ops, it seems that you want to report a bug if yes we are working 24/7 to improve our service and we will consider your report in the next versions.\n\nContact us! if you enjoyed STAP you can contact us for a deal or even in a new business (not a STAP deal).',
                  style: TextStyle(
                    fontSize: 16,
                    color: meta.colorPallet.pureBlack,
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    BetterFeedback.of(context).show((feedback) async {
                      // draft an email and send to developer
                      // final screenshotFilePath =
                      //     await writeImageToStorage(feedback.screenshot);

                      // final Email email = Email(
                      //   body: feedback.text,
                      //   subject: 'App Feedback',
                      //   recipients: ['beshoyakram22@gmail.com'],
                      //   attachmentPaths: [screenshotFilePath],
                      //   isHTML: false,
                      // );
                      // await FlutterEmailSender.send(email);
                    });
                  },
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
                        'Report',
                        style: TextStyle(color: meta.colorPallet.pureWhite),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.bug_report_outlined,
                        color: meta.colorPallet.pureWhite,
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        slideAnimatedRoute(const ContactScreen()));
                  },
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
                        'Contact us',
                        style: TextStyle(color: meta.colorPallet.pureWhite),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.near_me_outlined,
                        color: meta.colorPallet.pureWhite,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

writeImageToStorage(Uint8List screenshot) {}
