import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/data/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languages = ['Arabic', 'English'];
  @override
  Widget build(BuildContext context) {
    String selsectedLanguage =
        (context.locale == const Locale('ar', 'EG')) ? 'Arabic' : 'English';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: meta.colorPallet.primary700,
          title: Text(
            'Settings',
            style: TextStyle(
              color: meta.colorPallet.pureWhite,
            ),
          ),
          iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            // padding: const EdgeInsets.all(12),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: meta.colorPallet.grey200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.school_outlined,
                              color: meta.colorPallet.pureBlack,
                              size: 16,
                            )),
                        const SizedBox(width: 6),
                        Text(
                          'School settings'.tr(),
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: meta.colorPallet.grey200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: meta.colorPallet.grey300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.assignment_turned_in_sharp,
                                  color: meta.colorPallet.pureWhite,
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Session system',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                    Text(
                                      'Switch to take the attendance by the session not the day',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(children: [
                                Switch(
                                  value: false,
                                  onChanged: (value) {},
                                )
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: meta.colorPallet.grey200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: meta.colorPallet.grey300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.account_balance_sharp,
                                  color: meta.colorPallet.pureWhite,
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'IG school system',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                    Text(
                                      'Switch to IG school system (will be available next version and more systems will be available in the next versions.)',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                  ],
                                ),
                              )),
                          const Expanded(
                              flex: 2,
                              child: Column(children: [
                                // Switch(
                                //   value: false,
                                //   onChanged: (value) {},
                                // )
                              ]))
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            // padding: const EdgeInsets.all(12),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: meta.colorPallet.grey200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.person,
                              color: meta.colorPallet.pureBlack,
                              size: 16,
                            )),
                        const SizedBox(width: 6),
                        const Text(
                          'Personal settings',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: meta.colorPallet.grey200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: meta.colorPallet.grey300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.dark_mode,
                                  color: meta.colorPallet.pureWhite,
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dark mode',
                                      style: TextStyle(
                                          color: meta.colorPallet.pureBlack),
                                    ),
                                    Text(
                                      'Switch the app to dark mode',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(children: [
                                Consumer<ThemeProvider>(
                                    builder: (context, themeProvider, child) {
                                  return Switch(
                                    value: themeProvider.isDarkMode,
                                    onChanged: (value) {
                                      themeProvider.toggleTheme();
                                    },
                                  );
                                })
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: meta.colorPallet.grey200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: meta.colorPallet.grey300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.translate,
                                  color: meta.colorPallet.pureWhite,
                                ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Language',
                                      style: TextStyle(
                                          color: meta.colorPallet.pureBlack),
                                    ),
                                    Text(
                                      'Choose one of the following languages for more personalized experience',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: meta.colorPallet.primary600,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButton<String>(
                                    // iconSize: 0,
                                    iconEnabledColor:
                                        meta.colorPallet.pureWhite,
                                    dropdownColor: meta.colorPallet.primary600,
                                    borderRadius: BorderRadius.circular(10),
                                    isExpanded: true,
                                    // isDense: true,
                                    style: TextStyle(
                                        color: meta.colorPallet.pureWhite,
                                        fontWeight: FontWeight.w500),
                                    underline: const Center(),
                                    icon: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child:
                                          Icon(Icons.arrow_drop_down_rounded),
                                    ),
                                    value: selsectedLanguage,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selsectedLanguage = newValue!;
                                        if (context.locale ==
                                                const Locale('en', 'US') &&
                                            selsectedLanguage == 'Arabic') {
                                          // ignore: deprecated_member_use
                                          context.locale =
                                              const Locale('ar', 'EG');
                                        } else if (context.locale ==
                                                const Locale('ar', 'EG') &&
                                            selsectedLanguage == 'English') {
                                          // ignore: deprecated_member_use
                                          context.locale =
                                              const Locale('en', 'US');
                                        }
                                      });
                                    },
                                    items: languages
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: meta.colorPallet.grey200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: meta.colorPallet.grey300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.shield,
                                  color: meta.colorPallet.pureWhite,
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Security and privacy',
                                      style: TextStyle(
                                          color: meta.colorPallet.pureBlack),
                                    ),
                                    Text(
                                      'Use the default finger print, eye bio-metric, face recognition or even your PIN if available for more security.',
                                      style: TextStyle(
                                          color: meta.colorPallet.grey300),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(children: [
                                Switch(
                                  value: false,
                                  onChanged: (value) {},
                                )
                              ]))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
