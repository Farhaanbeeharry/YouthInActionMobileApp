import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/header/drawer/drawerController.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    DrawerCompController.context = context;
    DrawerCompController.init();

    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(
                  'assets/images/backgrounds/loginBack.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: secondaryColor,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(DrawerCompController.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: DrawerCompController.getMenuItems(),
                    ),
                  )
                ],
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
      ),
    );
  }
}
