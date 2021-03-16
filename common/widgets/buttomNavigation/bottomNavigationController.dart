import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/models.dart';
import 'package:yia/common/widgets/buttomNavigation/bottomNavigation.dart';
import 'package:yia/common/widgets/defaultView/defaultController.dart';

class BottomNavigationController implements Controller {
  static BuildContext context;
  static BottomNavigationViewState view;

  static int currentIndex = 0;
  static List<Widget> widgets = []; //to do
  static Widget activeWidget = widgets[currentIndex];
  static bool show = true;
  static List<BottomNavigationBarItem> bottomNavigation = [
    BottomNavigationBarItem(
      icon: new Icon(Icons.history),
      title: Text("History"),
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.import_contacts),
      title: Text("Calculations"),
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.settings),
      title: Text("Settings"),
    )
  ];

  static showHide(bool show) {
    //print(show);
    if (view != null)
      DefaultController.view
          .callSetState(() => {BottomNavigationController.show = show});
  }

  static void changeIndex(int index) {
    view.callSetState(() => {currentIndex = index});
  }
}
