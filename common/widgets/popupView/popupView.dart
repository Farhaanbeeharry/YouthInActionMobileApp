import 'package:flutter/material.dart';
import 'package:yia/common/default.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/popupView/popupViewController.dart';

class PopupView extends StatefulWidget {
  final Widget content;
  final BuildContext context;
  final bool scrollOnKeyboardPullUp;
  final bool showNavigation;
  final double height;

  PopupView(this.content, this.context, this.scrollOnKeyboardPullUp,
      this.showNavigation, this.height);

  @override
  PopupViewState createState() => PopupViewState();
}

class PopupViewState extends State<PopupView> {
  void callSetState(callback) {
    setState(() {
      callback();
    });
  }

  PopupViewState() {
    PopupViewController.view = this;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.height);
    DefaultService.defaultScrollController = new ScrollController();
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
                    child: Container(),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: DefaultService.defaultScrollController,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: widget.height,
                    width: MediaQuery.of(context).size.width,
                    child: widget.content,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
