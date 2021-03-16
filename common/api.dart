import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';

class ApiService {
  static _redirectToLogin(BuildContext context) {
    new Timer(
        new Duration(seconds: 2),
        () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginView()))
            });
  }

  static Future<BaseReturnType<T>> post<T>(
      String url, dynamic data, BuildContext context,
      [bool stringData = false]) async {
    String sessionToken = await DBProvider.db.getValueByKey("SessionToken");
    String userToken = await DBProvider.db.getValueByKey("UserToken");

    print(url);

    data["sessionToken"] = sessionToken;
    data["userToken"] = userToken;

    String body = stringData ? data : jsonEncode(data);

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body);

    if (response.body == "Session Timed Out") {
      CustomSnackBar.showMessage(
          "error", "Session timed out. Login again!", context);
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      BaseReturnType<T> baseReturnType =
          new BaseReturnType<T>().cast(json.decode(response.body));

      // if (!baseReturnType.isValid) _redirectToLogin(context);
      return baseReturnType;
    }
  }
}
