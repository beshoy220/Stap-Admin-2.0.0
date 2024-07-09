import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/presentation/components/home_screen_components/home/tabs/boards_tab.dart';
import 'package:stap_admin/presentation/components/home_screen_components/home/tabs/feed_tab.dart';
import 'package:stap_admin/presentation/components/home_screen_components/home/tabs/teachers_tab.dart';

var homeTabBar = TabBar(
  unselectedLabelColor: meta.colorPallet.grey200,
  labelStyle: TextStyle(color: meta.colorPallet.pureWhite),
  tabs: const [
    Tab(
      icon: Icon(Icons.web_asset_rounded),
      text: 'Feed',
    ),
    Tab(
      icon: Icon(Icons.people_alt_outlined),
      text: 'Teachers',
    ),
    Tab(
      icon: Icon(Icons.tv),
      text: 'Boards',
    ),
  ],
);

class HomeTabBarView extends StatefulWidget {
  const HomeTabBarView({super.key});

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [FeedTab(), TeacherTab(), BoardsTab()],
    );
  }
}
