import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yia/common/default.dart';
import 'package:yia/common/models.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/header/header/headerView.dart';

class HeaderController extends Controller {
  static String title = "Mauri-Farm";
  static BuildContext context;
  static HeaderViewState view;
  static BuildContext navigationContext;
  static bool menu = false;
  static bool back = false;
  static dynamic backCallback;

  static Color loadingBackgroundColor = primaryColor;
  static Animation<Color> loadingColor =
      new AlwaysStoppedAnimation<Color>(primaryColor);

  static void setTitle(String t) {
    view.callSetState(() => {title = t});
  }

  static showHideLoading([bool show = true]) {
    if (view == null) return;
    view.callSetState(() {
      if (!show) {
        print('removing');
        loadingBackgroundColor = primaryColor;
        loadingColor = new AlwaysStoppedAnimation<Color>(primaryColor);
      } else {
        print('adding');
        loadingBackgroundColor = Colors.white;
        loadingColor = new AlwaysStoppedAnimation<Color>(Colors.grey);
      }
    });
  }

  static showHideMenu([bool show = true]) {
    if (show) back = false;
    new Timer(new Duration(milliseconds: 100), () {
      view.callSetState(() {
        HeaderController.menu = show;
      });
    });
  }

  static showHideBack(BuildContext context, bool show, String title, callback) {
    if (show) menu = false;
    navigationContext = context;
    backCallback = callback;
    //if (title != null) setTitle(title);

    new Timer(new Duration(milliseconds: 100), () {
      view.callSetState(() {
        HeaderController.back = show;
      });
    });
  }

  static buttonPressed() {
    if (HeaderController.menu) {
      Scaffold.of(context).openDrawer();
    } else if (back) {
      back = false;
      try {
        setTitle("Mauri-Farm");
        Navigator.pop(navigationContext);
      } catch (e) {
        DefaultService.showMessage(
            'error', 'Failed to move to previous page', context);
      }

      if (backCallback != null) backCallback();
    }
  }
}
