import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/screens/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  // final Widget navigateTo;
  const SplashScreen({
    super.key,
    //  required this.navigateTo
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .pushReplacement(slideAnimatedRoute(const AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meta.colorPallet.primary700,
      body: Column(
        children: [
          const Expanded(child: Center()),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                meta.appLogo,
                width: 80,
                height: 80,
              ),
              Text(
                meta.fullAppName,
                style: TextStyle(
                  fontSize: 32,
                  color: meta.colorPallet.pureWhite,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
