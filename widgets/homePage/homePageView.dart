import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/homePage/homePageController.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with View<HomePageView> {
  HomePageController homePageController = new HomePageController();

  void _onItemTapped(int index) {
    setState(() {
      homePageController.selectedIndex = index;
    });
  }

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bell),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.syncAlt),
            label: 'Sync',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            label: 'Log out',
          ),
        ],
        currentIndex: homePageController.selectedIndex,
        unselectedItemColor: Color(0xFFB9B9B9),
        selectedItemColor: Colors.black,
        selectedFontSize: 14.0,
        selectedLabelStyle:
            TextStyle(fontFamily: "Segoe UI", color: Colors.black),
        iconSize: 26.0,
        onTap: _onItemTapped,
      ),
      body: homePageController.widgetOptions
          .elementAt(homePageController.selectedIndex),
    );
  }

  @override
  Controller getController() {
    return homePageController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.HomePage;
  }
}
