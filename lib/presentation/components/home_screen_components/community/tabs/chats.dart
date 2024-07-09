import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/data/local_data/grade_class_enum_list.dart';
import 'package:stap_admin/logic/local_utilities/slide_animated_route.dart';
import 'package:stap_admin/presentation/screens/branches/chats/chat_room_screen.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: gradeList.length,
      itemBuilder: (BuildContext context, int gradeIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              color: meta.colorPallet.grey100,
              child: Text(
                gradeList[gradeIndex],
                style: const TextStyle(fontSize: 26),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: classList.length,
              itemBuilder: (BuildContext context, int classIndex) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        slideAnimatedRoute(ChatRoomScreen(
                          roomGradeClass:
                              'Room ${classIndex + 1} - ${gradeList[gradeIndex]} - ${classList[classIndex]}',
                        )));
                  },
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: meta.colorPallet.grey100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: meta.colorPallet.grey100,
                                // borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.school_outlined,
                                color: meta.colorPallet.primary700,
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Room ${classIndex + 1}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: meta.colorPallet.primary500,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'New Messages',
                                        style: TextStyle(
                                          color: meta.colorPallet.primary500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${gradeList[gradeIndex]} ${classList[classIndex]}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: meta.colorPallet.grey300),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
