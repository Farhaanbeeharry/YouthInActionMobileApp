import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/homePage/homePageView.dart';
import 'package:yia/widgets/setLocation/setLocation.dart';

class ChangePasswordController extends Controller {
  BuildContext secondaryContext;
  final formKey = GlobalKey<FormState>();

  changePassword(String password, bool setLocation) async {
    if (formKey.currentState.validate()) {
      var data = {"password": password};

      BaseReturnType response =
          await ApiService.post(ApiUrl.CHANGEPASSWORD, data, context);

      if (response.success) {
        CustomSnackBar.showMessage(
            "success", "Password changed successful", secondaryContext);

        if (setLocation) {
          new Timer(new Duration(seconds: 2), () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SetLocation()));
          });
        } else {
          new Timer(new Duration(seconds: 2), () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageView()));
          });
        }
      } else {
        CustomSnackBar.showMessage("error", response.error, secondaryContext);
      }
    }
  }
}
