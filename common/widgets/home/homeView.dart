import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yia/common/default.dart';
import 'package:yia/common/widgets/buttomNavigation/bottomNavigationController.dart';
import 'package:yia/common/widgets/home/homeController.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultService.initDefaultPage(HomeScafold(), context, true, true);
  }
}

class HomeScafold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgrounds/back6.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  HomeBodyState() {
    HomeController.view = this;
  }
  callSetState(callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeController.context = context;

    Timer(new Duration(milliseconds: 1), () {
      BottomNavigationController.showHide(true);
      DefaultService.changeDefaultScrollViewHeight(
          MediaQuery.of(context).size.height - 140);
    });
    return BottomNavigationController.activeWidget;
  }
}
