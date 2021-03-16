import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/homePage/homePageView.dart';

class SetLocationController extends Controller {
  BuildContext secondaryContext;

  updateMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    var data = {
      "latitude": position.latitude.toString(),
      "longitude": position.longitude.toString()
    };

    BaseReturnType response =
        await ApiService.post(ApiUrl.SETUSERLOCATION, data, secondaryContext);

    if (response.success) {
      CustomSnackBar.showMessage(
          "success", "Your location is now synced!", secondaryContext);
      new Timer(new Duration(seconds: 2), () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePageView()));
      });
    } else {
      CustomSnackBar.showMessage("error", response.error, secondaryContext);
    }
  }
}
