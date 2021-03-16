import 'package:flutter/material.dart';
import 'package:yia/common/default.dart';
import 'package:yia/common/models.dart';
import 'package:yia/common/prefs.dart';

class DrawerCompController extends Controller {
  static BuildContext context;
  static String name;
  static List<Map<String, dynamic>> menuItems = [
    {'display': 'Order Food', 'page': 'home', 'icon': Icons.fastfood},
    {'display': 'Logout', 'page': null, 'icon': Icons.power_settings_new}
  ];

  static void init() {
    name = PrefsService.prefs.getString('firstName') ??
        "" + PrefsService.prefs.getString('lastName') ??
        "";
  }

  static List<Widget> getMenuItems() {
    List<Widget> ret = [];
    for (var item in menuItems) {
      IconData icon = DefaultService.cast<IconData>(item['icon']);
      ret.add(FlatButton(
        onPressed: () {
          if (item['page'] == null)
            DefaultService.logout(context);
          else
            DefaultService.changePage(item['page'], context);
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  right: 10, left: MediaQuery.of(context).size.width * 0.05),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(item['display'],
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white)),
          ],
        ),
      ));
    }
    return ret;
  }
}
