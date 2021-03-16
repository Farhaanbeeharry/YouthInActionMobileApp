import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/validator.dart';
import 'package:yia/widgets/authentication/forgotPassword/forgotPasswordView.dart';
import 'package:yia/widgets/authentication/login/loginController.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with View<LoginView> {
  LoginController loginController = new LoginController();

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
              loginController.secondaryContext = context;
              return Container(
                color: Color(0xFFEBEBEB),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 42.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/loginScreen.png",
                          width: MediaQuery.of(context).size.width * 0.67,
                        ),
                      ),
                      SizedBox(
                        height: 26.0,
                      ),
                      Text(
                        "Welcome!",
                        style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 40.0,
                            color: Color(0xFF4A38F3)),
                      ),
                      Text(
                        "A hero doesn't always wear a cap...",
                        style: TextStyle(
                            fontFamily: "Segoe UI Semilight Italic",
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(50.0)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: TextFormField(
                          controller: loginController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 14.0,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email address";
                            } else if (!Validator.validateEmail(value)) {
                              return "Invalid email address";
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
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              fontFamily: "Segoe UI Semilight Italic",
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(50.0)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: TextFormField(
                          controller: loginController.passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password";
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
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25.0,
                                ),
                                CircularCheckBox(
                                  activeColor: Color(0xFF6B62FF),
                                  value: loginController.rememberMeBox,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  onChanged: (value) {
                                    callSetState(() {
                                      loginController.rememberMeBox =
                                          !loginController.rememberMeBox;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize: 12.0,
                                    color: Color(0xFF4B5461),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordView()));
                                  },
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize: 12.0,
                                      color: Color(0xFF4D38F3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 36.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            loginController.login(
                                loginController.emailController.text,
                                loginController.passwordController.text);
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
                                "Login",
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
                        height: 26.0,
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
    return loginController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.Login;
  }
}
