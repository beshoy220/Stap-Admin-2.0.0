import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meta.colorPallet.primary700,
      appBar: AppBar(
        backgroundColor: meta.colorPallet.primary700,
        iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Image.asset(
              'assets/logo.png',
              width: 50,
              height: 50,
            ),
            Text(
              meta.fullAppName,
              style: TextStyle(color: meta.colorPallet.pureWhite, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'Contact us! if you enjoyed STAP you can contact us for a deal or even in a new business (not a STAP deal).',
                style: TextStyle(
                  color: meta.colorPallet.pureWhite,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: contactController,
                maxLines: 8,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Message...',
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 10.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
                      'Send',
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
            ),
          ])),
    );
  }
}
