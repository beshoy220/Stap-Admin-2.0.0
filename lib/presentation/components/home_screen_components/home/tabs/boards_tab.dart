import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:text_scroll/text_scroll.dart';

class BoardsTab extends StatefulWidget {
  const BoardsTab({super.key});

  @override
  State<BoardsTab> createState() => _BoardsTabState();
}

class _BoardsTabState extends State<BoardsTab> {
  bool isThereContentToShow = true;

  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return isThereContentToShow
        ? RefreshIndicator(
            onRefresh: _refresh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: meta.colorPallet.grey200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.tv_rounded,
                            // color: meta.colorPallet.pureWhite,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '9/42 Accepted boards',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'By accepting boards you are growing your school and you open more STAP admin capability',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: meta.colorPallet.grey200,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.tv_rounded,
                                          // color: meta.colorPallet.pureWhite,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextScroll(
                                                'Grade 12 - Class A     ',
                                                velocity: Velocity(
                                                    pixelsPerSecond:
                                                        Offset(15, 0)),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'This board have been registered at 2:01 PM 22/12/2024     ',
                                                      // velocity: Velocity(
                                                      //     pixelsPerSecond:
                                                      //         Offset(15, 0)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red[800],
                                            fixedSize: const Size(130, 0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Reject',
                                                style: TextStyle(
                                                    color: meta
                                                        .colorPallet.pureWhite),
                                              ),
                                              // Icon(
                                              //   Icons.double_arrow_sharp,
                                              //   color: meta.colorPallet.pureWhite,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green[800],
                                            fixedSize: const Size(130, 0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Accept',
                                                style: TextStyle(
                                                    color: meta
                                                        .colorPallet.pureWhite),
                                              ),
                                              // Icon(
                                              //   Icons.check_box,
                                              //   color: meta.colorPallet.pureWhite,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  Center(
                    child: Image.asset(
                      'assets/undraw_pics/1.png',
                      scale: 3,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Ops, there is no bards!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'It seems that STAP did not found registed boards yet. No worries as soon as a board will register we will notify you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
