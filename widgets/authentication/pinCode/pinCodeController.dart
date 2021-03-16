import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/loginModel.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/authentication/changePassword/changePasswordView.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';
import 'package:yia/widgets/setLocation/setLocation.dart';

class PinCodeController extends Controller {
  TextEditingController pinController = new TextEditingController();
  BuildContext secondaryContext;
  Widget redirectWidget = Container();

  Future<bool> checkPin(int pinCode) async {
    int savedPinCode = int.parse(await DBProvider.db.getValueByKey("PinCode"));

    if (pinCode == savedPinCode)
      return true;
    else
      return false;
  }

  login(Widget destination) async {
    String email = await DBProvider.db.getValueByKey("EmailAddress");
    String password = await DBProvider.db.getValueByKey("Password");

    var data = {"email": email, "password": password};

    BaseReturnType<LoginModel> response =
        await ApiService.post(ApiUrl.LOGIN, data, context);

    if (response.success) {
      response.processedData = new LoginModel().cast(response.data);
      await DBProvider.db.updateValueByKey(
          "SessionToken", response.processedData.sessionToken);

      if (response.msg == "pswd change") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChangePasswordView(
                      setLocation: false,
                    )));
      } else if (response.msg == "pswd change && set location") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChangePasswordView(
                      setLocation: true,
                    )));
      } else if (response.msg == "set location") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SetLocation()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => destination));
      }
    } else {
      CustomSnackBar.showMessage("error", response.error, secondaryContext);
    }
  }

  addRedirectWidget(BuildContext context) {
    redirectWidget = Container(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Not ',
            style: new TextStyle(
              fontFamily: "Segoe UI Semilight",
              color: Color(0xFF7B7B7B),
              fontSize: 12.0,
            ),
          ),
          TextSpan(
            text: Common.emailAddress,
            style: new TextStyle(
              fontFamily: "Segoe UI",
              color: Color(0xFF7B7B7B),
              fontSize: 12.0,
            ),
          ),
          TextSpan(
            text: "? ",
            style: new TextStyle(
              fontFamily: "Segoe UI",
              color: Color(0xFF7B7B7B),
              fontSize: 12.0,
            ),
          ),
          TextSpan(
              text: 'Login',
              style: new TextStyle(
                fontFamily: "Segoe UI Semilight",
                color: Color(0xFF5765C2),
                fontSize: 12.0,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                }),
          TextSpan(
            text: ' again.',
            style: new TextStyle(
              fontFamily: "Segoe UI Semilight",
              color: Color(0xFF7B7B7B),
              fontSize: 12.0,
            ),
          ),
        ]),
      ),
    );
  }
}
