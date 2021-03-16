import 'package:flutter/material.dart';
import 'package:yia/common/default.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/buttomNavigation/bottomNavigation.dart';
import 'package:yia/common/widgets/defaultView/defaultController.dart';
import 'package:yia/common/widgets/header/header/headerView.dart';

class DefaultView extends StatefulWidget {
  final Widget content;
  final BuildContext context;
  final bool scrollOnKeyboardPullUp;
  final bool showNavigation;

  DefaultView(this.content, this.context, this.scrollOnKeyboardPullUp,
      this.showNavigation);

  @override
  DefaultViewState createState() => DefaultViewState();
}

class DefaultViewState extends State<DefaultView> {
  void callSetState(callback) {
    setState(() {
      callback();
    });
  }

  DefaultViewState() {
    DefaultController.view = this;
  }

  @override
  Widget build(BuildContext context) {
    DefaultService.defaultScrollController = new ScrollController();
    if (DefaultService.defaultScrollViewHeight == null)
      DefaultService.defaultScrollViewHeight =
          MediaQuery.of(context).size.height - 145;
    return Scaffold(
      resizeToAvoidBottomInset: widget.scrollOnKeyboardPullUp,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: HeaderView(),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: DefaultService.defaultScrollController,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: DefaultService.defaultScrollViewHeight,
                      width: MediaQuery.of(context).size.width,
                      child: widget.content,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationView(),
    );
  }
}
