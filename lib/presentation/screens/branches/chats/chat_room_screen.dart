import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/components/chat_room_components/vote_message.dart';
import 'package:stap_admin/presentation/screens/branches/chats/chat_engagement_screen.dart';

class ChatRoomScreen extends StatefulWidget {
  final String roomGradeClass;

  const ChatRoomScreen({super.key, required this.roomGradeClass});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  int? maxLine;
  TextEditingController messageController = TextEditingController();
  bool hasMessages = true;

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
      body: Column(
        children: [
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            color: meta.colorPallet.primary200,
            child: Center(
              child: Text(widget.roomGradeClass),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: hasMessages
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: VoteMessage(
                                  sentByMe: index == 2 ? true : false),
                            );
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 150),
                              Image.asset('assets/undraw_pics/3.png'),
                              const Text(
                                  'The full chat system isn\'t supported yet; only the voting feature is available. Support for the full chat system will be added in future versions.')
                            ],
                          ),
                        ))),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    child: TextField(
                      maxLines: maxLine,
                      minLines: 1,
                      onChanged: (value) {
                        setState(() {
                          if (value.length > 3) {
                            maxLine = 3;
                          }
                        });
                      },
                      controller: messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: meta.colorPallet.primary700,
                        hintText: 'Enter your message...',
                        hintStyle: TextStyle(color: meta.colorPallet.grey200),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                      style: TextStyle(color: meta.colorPallet.pureWhite),
                    )),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Align(
                    child: Tooltip(
                      message: 'Chat engagement',
                      child: Container(
                        decoration: BoxDecoration(
                          color: meta.colorPallet.primary700,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: meta.colorPallet.primary700,
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                            color: meta.colorPallet.pureWhite,
                            onPressed: () {
                              Navigator.of(context).push(slideAnimatedRoute(
                                  ChatEngagementScreen(
                                      roomGradeClass: widget.roomGradeClass)));
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Align(
                    child: Tooltip(
                      message: 'Send',
                      child: Container(
                        decoration: BoxDecoration(
                          color: meta.colorPallet.primary700,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: meta.colorPallet.primary700,
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                            color: meta.colorPallet.pureWhite,
                            onPressed: () {},
                            icon: const Icon(Icons.send)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
