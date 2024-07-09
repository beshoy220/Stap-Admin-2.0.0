import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/components/contact_and_report.dart';
import 'package:stap_admin/presentation/screens/home/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ShakeDetector? detector;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        // Function to be called when the phone shakes
        contactAndReport(context);
      },
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController schoolCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/auth_bg.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[50],
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: meta.colorPallet.primary700,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                              color: meta.colorPallet.primary700,
                              onPressed: () {
                                if (context.locale ==
                                    const Locale('en', 'US')) {
                                  // ignore: deprecated_member_use
                                  context.locale = const Locale('ar', 'EG');
                                } else if (context.locale ==
                                    const Locale('ar', 'EG')) {
                                  // ignore: deprecated_member_use
                                  context.locale = const Locale('en', 'US');
                                }
                              },
                              icon: const Icon(Icons.translate)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo2.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        meta.fullAppName,
                        style: const TextStyle(fontSize: 32),
                      ),
                      Text(
                        'Welcome admin!',
                        style: TextStyle(
                          color: meta.colorPallet.grey300,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: schoolCodeController,
                        decoration: const InputDecoration(
                          labelText: 'School Code',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10.0,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Column(
              children: [
                const Expanded(child: Center()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        slideAnimatedRoute(
                          const HomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: meta.colorPallet.primary700,
                      fixedSize: const Size(double.maxFinite, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
