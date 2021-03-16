import 'package:flutter/material.dart';

class LoginResponse {
  String userToken;
  String username;
}

class Controller {
  static BuildContext context;
  static StatefulWidget view;
}

enum PrefName { CalculationPeriod, loginEmail, loginPassword, rememberMe }
