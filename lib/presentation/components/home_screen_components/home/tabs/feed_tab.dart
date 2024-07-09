import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stap_admin/app/meta.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({super.key});

  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
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
                            Icons.web_asset,
                            // color: meta.colorPallet.pureWhite,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                            '48 Accepted feed this semester\n3 Archived feed this semester')
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                                'Irure ad enim enim id cupidatat.Laboris sunt culpa incididunt sint tempor duis exercitation dolore ea magna do ullamco Lorem cillum.Elit aliqua ea adipisicing laborum adipisicing.',
                                style: TextStyle(
                                    color: meta.colorPallet.pureWhite),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          side: BorderSide(
                                            color: meta.colorPallet.grey200,
                                          ),
                                          fixedSize: const Size(130, 35),
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
                                              'Archive',
                                              style: TextStyle(
                                                color: meta.colorPallet.grey200,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Icon(
                                              Icons.archive_outlined,
                                              color: meta.colorPallet.grey200,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green[600],
                                          fixedSize: const Size(130, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_box,
                                              color: meta.colorPallet.pureWhite,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Accept',
                                              style: TextStyle(
                                                  color: meta
                                                      .colorPallet.pureWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
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
                      'Ops, there is no feed!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'It seems that STAP did not found feed yet. No worries as soon as we have feed we will notify you.\nOR\nYou can create your own feed V2.1.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) => const HomeScreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: meta.colorPallet.grey200,
                      fixedSize: const Size(double.maxFinite, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create feed (Comming soon)',
                          style: TextStyle(color: meta.colorPallet.pureWhite),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.web_asset_rounded,
                          color: meta.colorPallet.pureWhite,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
