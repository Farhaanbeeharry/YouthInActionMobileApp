import 'package:flutter/material.dart';

class CustomSnackBar {
  static const Color successBackgroundColor = Color.fromRGBO(10, 145, 44, 1);
  static const Color errorBackgroundColor = Color.fromRGBO(181, 11, 11, 1);
  static const Color warningBackgroundColor = Color.fromRGBO(184, 167, 39, 1);
  static const Color infoBackgroundColor = Color.fromRGBO(40, 141, 184, 1);

  static showMessage(String type, String message, BuildContext context) {
    //get background color
    Color bgColor;

    switch (type.toLowerCase()) {
      case 'success':
        bgColor = successBackgroundColor;
        break;
      case 'warning':
        bgColor = warningBackgroundColor;
        break;
      case 'info':
        bgColor = infoBackgroundColor;
        break;
      case 'error':
        bgColor = errorBackgroundColor;
        break;
    }

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 14.0, fontFamily: "Segoe UI"),
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}
