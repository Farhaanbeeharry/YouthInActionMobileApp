import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/authentication/forgotPasswordSuccess/forgotPasswordSuccessController.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';

class ForgotPasswordSuccessView extends StatefulWidget {
  @override
  _ForgotPasswordSuccessViewState createState() =>
      _ForgotPasswordSuccessViewState();
}

class _ForgotPasswordSuccessViewState extends State<ForgotPasswordSuccessView>
    with View<ForgotPasswordSuccessView> {
  ForgotPasswordSuccessController forgotPasswordSuccessController =
      new ForgotPasswordSuccessController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFEBEBEB),
            child: Column(
              children: [
                SizedBox(
                  height: 52.0,
                ),
                Text(
                  "Yayy submitted!",
                  style: TextStyle(
                      fontFamily: "Segoe UI Semilight",
                      fontSize: 40.0,
                      color: Color(0xFF4A38F3)),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/successImage.png",
                    width: MediaQuery.of(context).size.width * 0.60,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Email submitted successfully. Login with the password sent to you via email. You will be asked to change your password after login. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Segoe UI Semilight Italic",
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text(
                    "Return to login",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 14.0,
                      color: Color(0xFF4D38F3),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return forgotPasswordSuccessController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ForgetPassword;
  }
}
