import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';
import 'package:yia/widgets/logOut/logOutSuccess/logOutSuccessController.dart';

class LogOutSuccessView extends StatefulWidget {
  @override
  _LogOutSuccessViewState createState() => _LogOutSuccessViewState();
}

class _LogOutSuccessViewState extends State<LogOutSuccessView>
    with View<LogOutSuccessView> {
  LogOutSuccessController logOutSuccessController =
      new LogOutSuccessController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mission Achieved!",
              style: TextStyle(
                fontFamily: "Segoe UI Bold",
                fontSize: 33.0,
                color: Color(0xFF653DF8),
              ),
            ),
            SizedBox(
              height: 75.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logOutSuccess.png",
                width: MediaQuery.of(context).size.width * 0.67,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Opacity(
              opacity: 0.36,
              child: Text(
                "Bye Folk :(",
                style: TextStyle(
                  fontFamily: "Segoe UI Bold",
                  fontSize: 33.0,
                  color: Color(0xFF653DF8),
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                child: Text(
                  "Go to Login",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    color: Color(0xFF4300FF),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return logOutSuccessController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.LogOutSuccess;
  }
}
