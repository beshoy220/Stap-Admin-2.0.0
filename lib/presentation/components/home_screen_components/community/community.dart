import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/presentation/components/home_screen_components/community/tabs/chats.dart';
import 'package:stap_admin/presentation/components/home_screen_components/community/tabs/media.dart';
import 'package:stap_admin/presentation/components/home_screen_components/community/tabs/votes.dart';

var communityTabBar = TabBar(
  unselectedLabelColor: meta.colorPallet.grey200,
  labelStyle: TextStyle(color: meta.colorPallet.pureWhite),
  tabs: const [
    Tab(
      icon: Icon(Icons.near_me_outlined),
      text: 'Chats',
    ),
    Tab(
      icon: Icon(Icons.assessment_outlined),
      text: 'Votes',
    ),
    Tab(
      icon: Icon(Icons.file_copy_outlined),
      text: 'Media',
    ),
  ],
);

class CommunityTabBarView extends StatefulWidget {
  const CommunityTabBarView({super.key});

  @override
  State<CommunityTabBarView> createState() => _CommunityTabBarViewState();
}

class _CommunityTabBarViewState extends State<CommunityTabBarView> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [Chats(), Votes(), Media()],
    );
  }
}
