import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:stap_admin/app/meta.dart';

class VoteMessage extends StatefulWidget {
  final bool sentByMe;

  const VoteMessage({super.key, required this.sentByMe});

  @override
  State<VoteMessage> createState() => _VoteMessageState();
}

class _VoteMessageState extends State<VoteMessage> {
  // Vote option should not execeed more than 35 characters but
  // the title can be any length
  final List<Map<String, dynamic>> _pollOptions = [
    {
      'id': '1',
      'title':
          '${'Anim aliquip adipisicing Sint ut excepteur laboris ullamco aute Lorem.'.substring(0, 25)}...',
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: !widget.sentByMe ? 1 : 0,
            child: !widget.sentByMe
                ? Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/profile.png'))),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(),
                  )),
        Expanded(
            flex: 8,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: widget.sentByMe
                      ? meta.colorPallet.transparent
                      : meta.colorPallet.grey100,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(widget.sentByMe ? 12 : 0),
                    topEnd: Radius.circular(widget.sentByMe ? 0 : 12),
                    bottomStart: const Radius.circular(12),
                    bottomEnd: const Radius.circular(12),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.sentByMe ? const Center() : Text('Mr Ahmed'),
                  FlutterPolls(
                    // pollEnded: true,
                    pollId: 'poll1',
                    pollOptionsFillColor: meta.colorPallet.transparent,
                    voteInProgressColor: meta.colorPallet.primary300,
                    votedProgressColor: meta.colorPallet.primary200,
                    votedBackgroundColor: Colors.grey[200],
                    pollOptionsSplashColor: meta.colorPallet.primary200,
                    leadingVotedProgessColor: meta.colorPallet.primary200,
                    pollTitle: const Text(
                      'Do consectetur pariatur elit commodo qui proident occaecat Lorem Lorem Lorem Lorem adipisicing incididunt.?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  Text('3:12 AM - 22/12/2024')
                ],
              ),
            )),
        Expanded(
            flex: widget.sentByMe ? 1 : 0,
            child: widget.sentByMe
                ? Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/profile.png'))),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(),
                  )),
      ],
    );
  }
}
