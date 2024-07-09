import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:stap_admin/app/meta.dart';

class Votes extends StatefulWidget {
  const Votes({super.key});

  @override
  State<Votes> createState() => _VotesState();
}

class _VotesState extends State<Votes> {
  // Vote option should not execeed more than 35 characters but
  // the title can be any length
  final List<Map<String, dynamic>> _pollOptions = [
    {
      'id': '1',
      'title':
          '${'Anim aliquip adipisicing Sint ut excepteur laboris ullamco aute Lorem.'.substring(0, 35)}...',
      'votes': 5,
    },
    {
      'id': '2',
      'title': 'Option 2',
      'votes': 3,
    },
    {
      'id': '3',
      'title': 'Option 3',
      'votes': 2,
    },
    {
      'id': '4',
      'title': 'Option 4',
      'votes': 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/profile.png',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Mr. Yousef',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: meta.colorPallet.primary500,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'from grade 11 - class D',
                                    style: TextStyle(
                                      color: meta.colorPallet.primary500,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '3:21 PM 21/3/2024',
                                    style: TextStyle(
                                        color: meta.colorPallet.grey300,
                                        fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FlutterPolls(
                        pollEnded: true,
                        pollId: 'poll1',
                        pollOptionsFillColor: meta.colorPallet.transparent,
                        voteInProgressColor: meta.colorPallet.primary300,
                        votedProgressColor: meta.colorPallet.primary200,
                        votedBackgroundColor: meta.colorPallet.grey100,
                        pollOptionsSplashColor: meta.colorPallet.primary200,
                        leadingVotedProgessColor: meta.colorPallet.primary200,
                        pollTitle: const Text(
                          'Do consectetur pariatur elit commodo qui proident occaecat Lorem Lorem Lorem Lorem adipisicing incididunt.?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        pollOptionsHeight: 45,
                        pollOptions: _pollOptions.map((option) {
                          return PollOption(
                            id: option['id'],
                            title: Text(option['title']),
                            votes: option['votes'],
                          );
                        }).toList(),
                        onVoted: (pollOption, newVotes) async {
                          // Simulate saving the vote
                          // await Future.delayed(const Duration(milliseconds: 200));
                          // setState(() {
                          //   _pollOptions.firstWhere((option) =>
                          //       option['id'] == pollOption.id)['votes'] = newVotes;
                          // });
                          return true;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
