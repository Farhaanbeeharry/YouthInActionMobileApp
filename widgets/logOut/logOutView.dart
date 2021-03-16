import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/logOut/logOutController.dart';
import 'package:yia/widgets/logOut/logOutSuccess/logOutSuccessView.dart';

class LogOutView extends StatefulWidget {
  @override
  _LogOutViewState createState() => _LogOutViewState();
}

class _LogOutViewState extends State<LogOutView> with View<LogOutView> {
  LogOutController logOutController = new LogOutController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      appBar: AppBar(
        toolbarHeight: 60.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "Log Out",
          style: TextStyle(
              fontFamily: "Segoe UI Bold", fontSize: 24.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: double.infinity,
                child: Icon(
                  FontAwesomeIcons.exclamationTriangle,
                  size: 30.0,
                  color: Color(0xFFF8D41F),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'By logging out, you will no longer have access to this Application unless you login again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    color: Color(0xFF9F9F9F),
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logOut.png",
                  width: MediaQuery.of(context).size.width * 0.67,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Contact ',
                        style: new TextStyle(
                          fontFamily: "Segoe UI",
                          color: Color(0xFF9F9F9F),
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: "Youth in Action ",
                        style: new TextStyle(
                          fontFamily: "Segoe UI Bold",
                          color: Color(0xFF9F9F9F),
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: "on: ",
                        style: new TextStyle(
                          fontFamily: "Segoe UI",
                          color: Color(0xFF9F9F9F),
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                          text: '+230 5256 5642',
                          style: new TextStyle(
                            fontFamily: "Segoe UI",
                            color: Color(0xFF5765C2),
                            fontSize: 12.0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              UrlLauncher.launch("tel://52565642");
                            }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () async {
                    await DBProvider.db.updateValueByKey("RememberMe", "false");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogOutSuccessView()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4136F1), Color(0xFF8743FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Log Out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Segoe UI Light",
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return logOutController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.LogOut;
  }
}
