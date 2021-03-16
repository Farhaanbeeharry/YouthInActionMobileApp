import 'package:flutter/material.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/buttomNavigation/bottomNavigationController.dart';
import 'package:yia/common/widgets/defaultView/defaultController.dart';
import 'package:yia/common/widgets/home/homeController.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  BottomNavigationViewState createState() => BottomNavigationViewState();
}

class BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BottomNavigationController.view = this;
  }

  void callSetState(callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationController.context = context;
    print(BottomNavigationController.show);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: BottomNavigationController.show ? 70 : 0,
      child: BottomNavigationBar(
        backgroundColor: primaryColor,
        fixedColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 9,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: inputHintColor),
        currentIndex: BottomNavigationController.currentIndex,
        items: BottomNavigationController.bottomNavigation,
        onTap: (index) {
          DefaultController.view.callSetState(() {
            BottomNavigationController.currentIndex = index;
            BottomNavigationController.activeWidget = BottomNavigationController
                .widgets[BottomNavigationController.currentIndex];
          });
          HomeController.view.callSetState(() => {});
        },
      ),
    );
  }
}
