import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/presentation/components/contact_and_report.dart';
import 'package:stap_admin/presentation/components/home_screen_components/custome_drawer.dart';
import 'package:stap_admin/presentation/components/home_screen_components/community/community.dart';
import 'package:stap_admin/presentation/components/home_screen_components/home/home.dart';
import 'package:stap_admin/presentation/components/home_screen_components/sessions/sessions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShakeDetector? detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        // Function to be called when the phone shakes
        contactAndReport(context);
      },
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeTabBarView(),
    const CommunityTabBarView(),
    const Sessions()
  ];

  final List _tabBarOptions = [homeTabBar, communityTabBar, null];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: meta.colorPallet
                .pureWhite, // The three lines icon color that opens drawer
          ),
          backgroundColor: meta.colorPallet.primary700,
          bottom: _tabBarOptions.elementAt(_selectedIndex),
          title: Text(
            meta.fullAppName,
            style: TextStyle(color: meta.colorPallet.pureWhite),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups_2_outlined),
                label: 'Commuinty',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined),
                label: 'Sessions',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: meta.colorPallet.pureWhite,
            unselectedItemColor: meta.colorPallet.grey200,
            backgroundColor: meta.colorPallet.primary700,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
