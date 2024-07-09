import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';

class CreateVoteScreen extends StatefulWidget {
  final String roomGradeClass;

  const CreateVoteScreen({super.key, required this.roomGradeClass});

  @override
  State<CreateVoteScreen> createState() => _CreateVoteScreenState();
}

class _CreateVoteScreenState extends State<CreateVoteScreen> {
  TextEditingController voteTopicController = TextEditingController();
  List<TextEditingController> voteOptionsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List allowenceList = [
    ['Teachers', ' are allowed to vote', true],
    ['Parents', ' are allowed to vote', true],
    ['Students', ' are allowed to vote', true]
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      widget.roomGradeClass,
                      style: TextStyle(
                        color: meta.colorPallet.pureWhite,
                      ),
                    ),
                    // const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: voteTopicController,
                        maxLines: 5,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Vote topic...',
                          alignLabelWithHint: true,
                          labelStyle:
                              TextStyle(color: meta.colorPallet.grey200),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10.0,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: voteOptionsControllers[1].text.isNotEmpty
                          ? voteOptionsControllers[2].text.isNotEmpty
                              ? 4
                              : 3
                          : 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8),
                          child: TextField(
                            controller: voteOptionsControllers[index],
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              setState(() {
                                voteOptionsControllers[index].text = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Option ${index + 1}...',
                              alignLabelWithHint: true,
                              labelStyle:
                                  TextStyle(color: meta.colorPallet.grey200),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 10.0,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: meta.colorPallet.grey300,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allowenceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allowenceList[index][0] +
                                    allowenceList[index][1],
                                style: TextStyle(
                                    color: meta.colorPallet.pureWhite),
                              ),
                              Switch(
                                activeColor: meta.colorPallet.pureWhite,
                                focusColor: meta.colorPallet.pureWhite,
                                inactiveThumbColor: meta.colorPallet.pureBlack,
                                hoverColor: meta.colorPallet.primary600,
                                value: allowenceList[index][2],
                                onChanged: (value) {
                                  setState(() {
                                    allowenceList[index][2] = value;
                                    if (!allowenceList[index][2]) {
                                      allowenceList[index][1] =
                                          ' are not allowed to vote';
                                    } else {
                                      allowenceList[index][1] =
                                          ' are allowed to vote';
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: meta.colorPallet.grey100,
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
                    style: TextStyle(color: meta.colorPallet.pureBlack),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.near_me_outlined,
                    color: meta.colorPallet.pureBlack,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
