import 'package:flutter/material.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/authentication/forgotPasswordSuccess/forgotPasswordSuccessView.dart';

class ForgotPasswordController extends Controller {
  BuildContext secondaryContext;
  final formKey = GlobalKey<FormState>();

  submitEmail(String emailAddress) async {
    if (formKey.currentState.validate()) {
      var data = {"email": emailAddress};

      BaseReturnType response =
          await ApiService.post(ApiUrl.FORGOTPASSWORD, data, context);

      print(response);

      if (response.success) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForgotPasswordSuccessView()));
      } else {
        CustomSnackBar.showMessage("error", response.error, secondaryContext);
      }
    }
  }
}
