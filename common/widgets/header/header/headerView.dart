import 'package:flutter/material.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/header/header/headerController.dart';

class HeaderView extends StatefulWidget {
  @override
  HeaderViewState createState() => HeaderViewState();
}

class HeaderViewState extends State<HeaderView> {
  HeaderViewState() {
    HeaderController.view = this;
  }

  callSetState(callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    HeaderController.context = context;

    return Container(
      height: 70,
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 30,
            width: 30,
            child: InkWell(
              onTap: () {
                HeaderController.buttonPressed();
              },
              child: Icon(
                HeaderController.menu ? Icons.menu : Icons.keyboard_backspace,
                color: HeaderController.menu || HeaderController.back
                    ? Colors.white
                    : primaryColor,
              ),
            ),
          ),
          Center(
            child: Text(
              HeaderController.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Merriweather',
              ),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              backgroundColor: HeaderController.loadingBackgroundColor,
              valueColor: HeaderController.loadingColor,
              strokeWidth: 1,
            ),
          )
        ]),
      ),
    );
  }
}
