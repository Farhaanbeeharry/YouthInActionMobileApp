import 'package:flutter/material.dart';

///colors

const Color successBackgroundColor = Color.fromRGBO(10, 145, 44, 1);
const Color errorBackgroundColor = Color.fromRGBO(181, 11, 11, 1);
const Color warningBackgroundColor = Color.fromRGBO(184, 167, 39, 1);
const Color infoBackgroundColor = Color.fromRGBO(40, 141, 184, 1);

const Color primaryColor = Color.fromRGBO(46, 118, 176, 1);
const Color primaryDisabledColor = Color.fromRGBO(101, 114, 125, 1);
const Color primaryDarkColor = Color.fromRGBO(24, 72, 112, 1);
const Color secondaryColor = Color.fromRGBO(184, 107, 40, 1);
const Color tertiaryColor = Color.fromRGBO(184, 40, 49, 1);

const Color inputLabelColor = Color.fromRGBO(176, 176, 176, 1);
const Color inputHintColor = Color.fromRGBO(176, 176, 176, 0.7);

const Color drawerColor = Color.fromRGBO(184, 107, 40, 0.5);

class Common {
  static String emailAddress = "null";
  static String workedCases = "0";
  static String nextCases = "0";
  static String currentCases = "0";
}

const TextStyle siteFormCardTitle = TextStyle(
  fontFamily: "Segoe UI Semibold",
  fontSize: 16.0,
  color: Colors.black,
);

const TextStyle siteFormCardSubtitle = TextStyle(
  fontFamily: "Segoe UI Light Italic",
  fontSize: 14.0,
  color: Colors.black,
);

const TextStyle dataCollectionCardTitle = TextStyle(
  fontFamily: "Segoe UI Bold",
  fontSize: 18.0,
  color: Color(0xFF000000),
);

const TextStyle dataCollectionCardText = TextStyle(
  fontFamily: "Segoe UI Light Italic",
  fontSize: 14.0,
  color: Color(0xFF272727),
);

const TextStyle dataCollectionCardTextFilled = TextStyle(
  fontFamily: "Segoe UI",
  fontSize: 14.0,
  color: Color(0xFF272727),
);
