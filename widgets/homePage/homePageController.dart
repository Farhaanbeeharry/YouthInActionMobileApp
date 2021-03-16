import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/widgets/logOut/logOutView.dart';
import 'package:yia/widgets/request/requestView.dart';
import 'package:yia/widgets/schedule/scheduleView.dart';
import 'package:yia/widgets/sync/syncView.dart';

class HomePageController extends Controller {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    ScheduleView(),
    RequestView(),
    SyncView(),
    LogOutView(),
  ];

  goToPage(int page) {
    page = page - 1;
    view.callSetState(() {
      selectedIndex = page;
    });
  }
}
