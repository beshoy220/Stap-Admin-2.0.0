import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/data/providers/theme_provider.dart';
import 'package:stap_admin/presentation/screens/pre_auth/splash_screen.dart';
import 'package:feedback/feedback.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    path: 'assets/translations',
    child: BetterFeedback(
        child: MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ], child: const MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: meta.fullAppName,
        theme: ThemeData(
          fontFamily: 'Imprima',
          brightness: themeProvider.currentTheme,
          // scaffoldBackgroundColor: Colors.black,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
