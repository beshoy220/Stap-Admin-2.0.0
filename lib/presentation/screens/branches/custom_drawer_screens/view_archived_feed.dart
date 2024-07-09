import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stap_admin/app/meta.dart';

class ViewArchivedFeedScreen extends StatelessWidget {
  const ViewArchivedFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Archived feed',
          style: TextStyle(
            color: meta.colorPallet.pureWhite,
          ),
        ),
        backgroundColor: meta.colorPallet.primary700,
        iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
      ),
      body: ListView.builder(
        itemCount: 12,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: (index == 0)
                ? const EdgeInsets.all(20)
                : const EdgeInsets.fromLTRB(20, 0, 20, 20),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              color: meta.colorPallet.primary700,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
                image: NetworkImage(
                    'https://images.unsplash.com/20/cambridge.JPG?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTV8fHVuaXZlcnNpdGllc3xlbnwwfHx8fDE3MTgzOTU1NTV8MA&ixlib=rb-4.0.3&q=80&w=1080'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    color: meta.colorPallet.pureWhite,
                    fontSize: 20,
                  ),
                ),
                ReadMoreText(
                  'Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  style: TextStyle(color: meta.colorPallet.pureWhite),
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: Colors.amber,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: meta.colorPallet.pureWhite,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Contact: +201200000000,\nWebsite: www.example.com',
                  style: TextStyle(
                      color: meta.colorPallet.pureWhite,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      fixedSize: const Size(double.maxFinite, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_box,
                          color: meta.colorPallet.pureWhite,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Accept the feed',
                          style: TextStyle(color: meta.colorPallet.pureWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
