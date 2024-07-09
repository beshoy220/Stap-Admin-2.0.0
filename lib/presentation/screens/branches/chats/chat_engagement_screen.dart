import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/screens/branches/chats/engagemant_options/create_vote_screen.dart';

class ChatEngagementScreen extends StatefulWidget {
  final String roomGradeClass;

  const ChatEngagementScreen({super.key, required this.roomGradeClass});

  @override
  State<ChatEngagementScreen> createState() => _ChatEngagementScreenState();
}

class _ChatEngagementScreenState extends State<ChatEngagementScreen> {
  List listOfChatEngagement = [
    [Icons.poll, 'Votes'],
    [Icons.file_copy, 'Media'],
    [Icons.watch_later, 'Remider'],
    [Icons.confirmation_num, 'Reservations']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meta.colorPallet.primary700,
        title: Text(
          meta.fullAppName,
          style: TextStyle(color: meta.colorPallet.pureWhite),
        ),
        iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
        centerTitle: true,
      ),
      backgroundColor: meta.colorPallet.primary700,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              widget.roomGradeClass,
              style: TextStyle(
                color: meta.colorPallet.pureWhite,
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      (index.isOdd ? 10 : 20), 10, (index.isOdd ? 20 : 10), 10),
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context)
                            .push(slideAnimatedRoute(CreateVoteScreen(
                          roomGradeClass: widget.roomGradeClass,
                        )));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: (index == 0)
                              ? meta.colorPallet.grey100
                              : meta.colorPallet.grey300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(listOfChatEngagement[index][0]),
                        ),
                        Text(listOfChatEngagement[index][1])
                      ]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
