import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/authentication/changePassword/changePasswordController.dart';
import 'package:yia/widgets/homePage/homePageView.dart';

class ChangePasswordView extends StatefulWidget {
  final bool setLocation;

  const ChangePasswordView({this.setLocation});
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView>
    with View<ChangePasswordView> {
  ChangePasswordController changePasswordController =
      new ChangePasswordController();

  TextEditingController changePasswordTextController =
      new TextEditingController();
  TextEditingController checkChangePasswordTextController =
      new TextEditingController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Builder(
            builder: (BuildContext context) {
              changePasswordController.secondaryContext = context;
              return Container(
                color: Color(0xFFEBEBEB),
                child: Form(
                  key: changePasswordController.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 52.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/changePasswordScreen.png",
                          width: MediaQuery.of(context).size.width * 0.60,
                        ),
                      ),
                      SizedBox(
                        height: 26.0,
                      ),
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 40.0,
                            color: Color(0xFF4A38F3)),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(50.0)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: TextFormField(
                          obscureText: true,
                          controller: changePasswordTextController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 14.0,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter a new password";
                            } else if (value.length < 6) {
                              return "Password too short";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 35),
                            border: new OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: "Segoe UI Semilight Italic",
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(50.0)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: TextFormField(
                          controller: checkChangePasswordTextController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password again";
                            } else if (value.length < 6) {
                              return "Password too short";
                            } else if (changePasswordTextController.text !=
                                checkChangePasswordTextController.text) {
                              return "Passwords do not match !";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 35),
                            border: new OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Confirm password',
                            labelStyle: TextStyle(
                              fontFamily: "Segoe UI Semilight Italic",
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            changePasswordController.changePassword(
                                changePasswordTextController.text,
                                widget.setLocation);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF4136F1),
                                    Color(0xFF8743FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Save",
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
                      SizedBox(
                        height: 16.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageView()));
                        },
                        child: Text(
                          "Remind me later",
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 12.0,
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
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return changePasswordController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ChangePassword;
  }
}
