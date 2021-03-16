import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/validator.dart';
import 'package:yia/widgets/authentication/forgotPassword/forgotPasswordController.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with View<ForgotPasswordView> {
  ForgotPasswordController forgotPasswordController =
      new ForgotPasswordController();

  TextEditingController emailController = new TextEditingController();

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
              forgotPasswordController.secondaryContext = context;
              return Container(
                color: Color(0xFFEBEBEB),
                child: Form(
                  key: forgotPasswordController.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 52.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/forgotPasswordScreen.png",
                          width: MediaQuery.of(context).size.width * 0.60,
                        ),
                      ),
                      SizedBox(
                        height: 26.0,
                      ),
                      Text(
                        "Forgot Password",
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                            labelText: 'Email address',
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
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            forgotPasswordController
                                .submitEmail(emailController.text);
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
                                "Submit",
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
                                  builder: (context) => LoginView()));
                        },
                        child: Text(
                          "Cancel",
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
    return forgotPasswordController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ForgetPassword;
  }
}
