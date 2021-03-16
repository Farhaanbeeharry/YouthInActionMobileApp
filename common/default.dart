import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yia/common/prefs.dart';
import 'package:yia/common/theme.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/defaultView/default.dart';
import 'package:yia/common/widgets/defaultView/defaultController.dart';
import 'package:yia/common/widgets/header/header/headerController.dart';
import 'package:yia/common/widgets/popupView/popupView.dart';

class DefaultService {
  static BuildContext mainContext;

  static double defaultScrollViewHeight;

  static ScrollController defaultScrollController;

  static void changeDefaultScrollViewHeight(double val) {
    DefaultController.view.callSetState(() {
      defaultScrollViewHeight = val;
    });
  }

  static checkDefaultSettings() {
    //PrefsService.prefs.setString('calculationPeriod', 'Monthly');
    if (PrefsService.prefs.getString('calculationPeriod') == null) {
      PrefsService.prefs.setString('calculationPeriod', 'Monthly');
    }
  }

  static initDefaultPage(Widget content, BuildContext context,
      [bool scrollOnKeyboardPullUp = true, bool showNavigation = true]) {
    HeaderController.menu = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: DefaultView(
        content,
        context,
        scrollOnKeyboardPullUp,
        showNavigation,
      ),
    );
  }

  static initPopupView(Widget content, BuildContext context, double height,
      [bool scrollOnKeyboardPullUp = true, bool showNavigation = true]) {
    HeaderController.menu = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: PopupView(
          content, context, scrollOnKeyboardPullUp, showNavigation, height),
    );
  }

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
        content: Text(message),
        backgroundColor: bgColor,
      ),
    );

    defaultScrollController.animateTo(
      MediaQuery.of(context).size.height,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  static Future<void> init() async {
    await PrefsService.getInstance();
  }

  static changePage(String page, BuildContext context) {
    print('viewing ' + page);
    Widget pg;

    switch (page.toLowerCase()) {
      case 'register':
        //pg = RegisterView();
        break;
      case 'login':
        //pg = LoginView();
        break;
      case 'verify':
        //pg = VerifyEmailView();
        break;
      case 'forgotpassword':
        //pg = ForgotPasswordView();
        break;
      case 'resetpassword':
        //pg = ResetPasswordView();
        break;
      case 'home':
        //pg = HomeView();
        break;
    }

    if (pg != null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => pg));
  }

  static T cast<T>(x) => x is T ? x : null;

  // static Future<bool> checkSession() async {
  //   Stream<User> users = FirebaseAuth.instance.authStateChanges();
  //   await for (User user in users) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //       return false;
  //     } else {
  //       print('User is signed in!');
  //       return true;
  //     }
  //   }
  // }

  static logout(BuildContext context) {
    PrefsService.prefs.remove('userToken');
    PrefsService.prefs.remove('loginEmail');
    PrefsService.prefs.remove('loginPassword');
    changePage('login', context);
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    // distance in km
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static void showPopup(BuildContext context, Widget title, Widget content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  static String convertMonth(int index) {
    print(index);
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    return months[index - 1];
  }

  static Future<bool> checkSession() async {
    return true;
  }
}
