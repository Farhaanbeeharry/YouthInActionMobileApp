import 'package:flutter/material.dart';
import 'package:yia/common/variables.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0,
        color: Colors.white,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 20.0,
        color: Colors.white,
      ),
      headline3: base.headline3.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 18.0,
        color: Colors.white,
      ),
      headline4: base.headline4.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 16.0,
        color: Colors.white,
      ),
      headline5: base.headline5.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 15.0,
        color: Colors.white,
      ),
      bodyText2: base.bodyText2.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 14.0,
        color: Colors.white,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      primaryColor: Color.fromRGBO(46, 118, 176, 1),
      accentColor: Colors.green,
      secondaryHeaderColor: Color.fromRGBO(184, 107, 40, 1),
      hintColor: Color.fromRGBO(227, 227, 227, 1),
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(46, 118, 176, 1),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      canvasColor: primaryColor);
}
