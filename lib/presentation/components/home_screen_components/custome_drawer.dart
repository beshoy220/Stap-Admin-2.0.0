import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/components/contact_and_report.dart';
import 'package:stap_admin/presentation/screens/auth/auth_screen.dart';
import 'package:stap_admin/presentation/screens/branches/custom_drawer_screens/school_statistics_screen.dart';
import 'package:stap_admin/presentation/screens/branches/custom_drawer_screens/set_exams_marks_scree.dart';
import 'package:stap_admin/presentation/screens/branches/custom_drawer_screens/settings_screen.dart';
import 'package:stap_admin/presentation/screens/branches/custom_drawer_screens/view_archived_feed.dart';
import 'package:text_scroll/text_scroll.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List listOfDrawerItems = [
      [Icons.web_asset_rounded, 'View archived feed', true],
      [Icons.insert_chart_outlined_outlined, 'School statistics', true],
      [Icons.library_add_check_outlined, 'Set exams marks', false],
      [Icons.settings_outlined, 'Settings', true],
      [Icons.bug_report_outlined, 'Report or contact us', true],
    ];
    return Drawer(
      backgroundColor: meta.colorPallet.primary700,
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              DrawerHeader(
                // padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: meta.colorPallet.primary100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                              child: Stack(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: meta.colorPallet.grey100),
                              ),
                              // CircleAvatar(
                              //   radius: 15,
                              //   backgroundColor: Colors.white,
                              // ),
                            ],
                          )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextScroll(
                                '   El sherouk language school     ',
                                velocity: const Velocity(
                                    pixelsPerSecond: Offset(15, 0)),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: meta.colorPallet.pureWhite),
                              ),
                              Text(
                                'School admin',
                                style: TextStyle(
                                  color: meta.colorPallet.grey200,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: listOfDrawerItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: meta.colorPallet.pureWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          listOfDrawerItems[index][0],
                          color: meta.colorPallet.primary600,
                          size: 18,
                        ),
                      ),
                      title: Text(
                        listOfDrawerItems[index][1],
                        style: TextStyle(
                          color: meta.colorPallet.pureWhite,
                        ),
                      ),
                      onTap: () {
                        if (index != 4) {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                slideAnimatedRoute(
                                  const ViewArchivedFeedScreen(),
                                ));
                          } else if (index == 1) {
                            Navigator.push(
                                context,
                                slideAnimatedRoute(
                                  const SchoolStatisticsScreen(),
                                ));
                          } else if (index == 2) {
                            Navigator.push(
                                context,
                                slideAnimatedRoute(
                                  const SetExamsMarksScreen(),
                                ));
                          } else {
                            Navigator.push(
                                context,
                                slideAnimatedRoute(
                                  const SettingsScreen(),
                                ));
                          }
                        } else {
                          contactAndReport(context);
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 120)
            ],
          ),
          Column(
            children: [
              const Expanded(child: Center()),
              Container(
                color: meta.colorPallet.primary700,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              slideAnimatedRoute(const AuthScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: meta.colorPallet.pureBlack,
                          fixedSize: const Size(double.maxFinite, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Log out',
                              style:
                                  TextStyle(color: meta.colorPallet.pureWhite),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.output_rounded,
                              color: meta.colorPallet.pureWhite,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Version ${meta.appVersion}',
                            style: TextStyle(color: meta.colorPallet.pureWhite),
                          ),
                          Text(
                            meta.appSlogan,
                            style: TextStyle(color: meta.colorPallet.pureWhite),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
