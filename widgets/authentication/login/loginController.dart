import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/loginModel.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/authentication/changePassword/changePasswordView.dart';
import 'package:yia/widgets/authentication/pinCode/pinCodeView.dart';
import 'package:yia/widgets/homePage/homePageView.dart';
import 'package:yia/widgets/setLocation/setLocation.dart';

class LoginController extends Controller {
  BuildContext secondaryContext;
  final formKey = GlobalKey<FormState>();
  bool rememberMeBox = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  login(String email, String password) async {
    if (formKey.currentState.validate()) {
      FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
      String deviceToken = await firebaseMessaging.getToken();

      var data = {
        "email": email,
        "password": password,
        "device_token": deviceToken
      };

      BaseReturnType<LoginModel> response =
          await ApiService.post(ApiUrl.LOGIN, data, context);

      if (response.success) {
        response.processedData = new LoginModel().cast(response.data);

        await DBProvider.db.updateValueByKey("DeviceToken", deviceToken);
        await DBProvider.db
            .updateValueByKey("RememberMe", rememberMeBox.toString());
        await DBProvider.db
            .updateValueByKey("EmailAddress", emailController.text);
        await DBProvider.db
            .updateValueByKey("Password", passwordController.text);
        await DBProvider.db
            .updateValueByKey("UserToken", response.processedData.userToken);
        await DBProvider.db.updateValueByKey(
            "SessionToken", response.processedData.sessionToken);

        if (response.msg == "pswd change") {
          if (rememberMeBox) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PinCodeView(
                          title: "Create Pin Code",
                          previousPin: 0000,
                          checkPrevious: false,
                          checkDBPin: false,
                          goToConfirm: true,
                          changePassword: true,
                        )));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangePasswordView(
                          setLocation: false,
                        )));
          }
        } else if (response.msg == "pswd change && set location") {
          await DBProvider.db.updateValueByKey("SetLocation", "true");
          if (rememberMeBox) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PinCodeView(
                          title: "Create Pin Code",
                          previousPin: 0000,
                          checkPrevious: false,
                          checkDBPin: false,
                          goToConfirm: true,
                          changePassword: true,
                        )));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangePasswordView(
                          setLocation: true,
                        )));
          }
        } else if (response.msg == "set location") {
          await DBProvider.db.updateValueByKey("SetLocation", "true");
          if (rememberMeBox) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PinCodeView(
                          title: "Create Pin Code",
                          previousPin: 0000,
                          checkPrevious: false,
                          checkDBPin: false,
                          goToConfirm: true,
                          changePassword: false,
                        )));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SetLocation()));
          }
        } else {
          if (rememberMeBox) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PinCodeView(
                          title: "Create Pin Code",
                          previousPin: 0000,
                          checkPrevious: false,
                          checkDBPin: false,
                          goToConfirm: true,
                          changePassword: false,
                        )));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageView()));
          }
        }
      } else {
        CustomSnackBar.showMessage("error", response.error, secondaryContext);
      }
    }
  }
}
