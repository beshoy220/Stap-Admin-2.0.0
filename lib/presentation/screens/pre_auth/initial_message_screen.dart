import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/screens/home/home_screen.dart';

// Make sure to chack if the user if authenticated first before using this widget
// then check if the title, body and image are avaialble
// TO-IMPLEMENT:
// use url_lancher package to make this more useful
class InitialMessageScreen extends StatelessWidget {
  const InitialMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meta.colorPallet.primary700,
      appBar: AppBar(
        title: Text(
          meta.fullAppName,
          style: TextStyle(color: meta.colorPallet.pureWhite),
        ),
        backgroundColor: meta.colorPallet.primary700,
        centerTitle: true,
        iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  'Title',
                  style: TextStyle(
                      color: meta.colorPallet.pureWhite, fontSize: 20),
                ),
                Text(
                  'Aliqua enim cupidatat laboris ex laboris incididunt excepteur sint exercitation dolor in anim ad.Fugiat ullamco eiusmod anim commodo elit esse dolor mollit dolor non.',
                  style: TextStyle(
                      color: meta.colorPallet.pureWhite, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(
                    'https://site.surveysparrow.com/wp-content/uploads/2022/10/simple-random-sampling.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
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
                      backgroundColor: meta.colorPallet.pureBlack,
                      fixedSize: const Size(double.maxFinite, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go home',
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
          )),
    );
  }
}
