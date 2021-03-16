import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/authentication/changePassword/changePasswordView.dart';
import 'package:yia/widgets/authentication/pinCode/pinCodeController.dart';
import 'package:yia/widgets/homePage/homePageView.dart';

class PinCodeView extends StatefulWidget {
  final String title;
  final int previousPin;
  final Widget destination;
  final bool goToConfirm;
  final bool checkDBPin;
  final bool checkPrevious;
  final bool changePassword;

  const PinCodeView(
      {this.title,
      this.previousPin,
      this.destination,
      this.goToConfirm,
      this.checkDBPin,
      this.checkPrevious,
      this.changePassword});

  @override
  _PinCodeViewState createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> with View<PinCodeView> {
  PinCodeController pinCodeController = new PinCodeController();

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
              if (widget.checkDBPin)
                pinCodeController.addRedirectWidget(context);
              pinCodeController.secondaryContext = context;
              pinCodeController.secondaryContext = context;
              return Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 42.0,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 28.0,
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontFamily: "Segoe UI Bold",
                                fontSize: 24.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 21.0,
                      color: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/securePin.png",
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    PinCodeTextField(
                      controller: pinCodeController.pinController,
                      hideCharacter: true,
                      defaultBorderColor: Colors.black26,
                      hasTextBorderColor: Colors.black,
                      maxLength: 4,
                      maskCharacter: "⚫",
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.awesomeTransition,
                      pinTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF4A38F3),
                      ),
                      pinBoxWidth: 60,
                      onDone: (value) async {
                        int pinCode = int.parse(value);

                        if (widget.goToConfirm) {
                          if (widget.changePassword) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PinCodeView(
                                  title: "Confirm Pin Code",
                                  previousPin: pinCode,
                                  destination: ChangePasswordView(),
                                  goToConfirm: false,
                                  checkDBPin: false,
                                  checkPrevious: true,
                                  changePassword: true,
                                ),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PinCodeView(
                                  title: "Confirm Pin Code",
                                  previousPin: pinCode,
                                  destination: HomePageView(),
                                  goToConfirm: false,
                                  checkDBPin: false,
                                  checkPrevious: true,
                                  changePassword: false,
                                ),
                              ),
                            );
                          }
                        } else if (widget.checkPrevious) {
                          if (pinCode != widget.previousPin) {
                            pinCodeController.pinController.clear();
                            CustomSnackBar.showMessage(
                                "error",
                                "Pin Code does not match. Try again!",
                                pinCodeController.secondaryContext);
                          } else {
                            await DBProvider.db
                                .updateValueByKey("PinCode", value);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => widget.destination));
                          }
                        } else if (widget.checkDBPin) {
                          if (await pinCodeController.checkPin(pinCode)) {
                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult ==
                                    ConnectivityResult.mobile ||
                                connectivityResult == ConnectivityResult.wifi) {
                              await pinCodeController.login(widget.destination);
                            } else {
                              try {
                                CustomSnackBar.showMessage(
                                    "warning",
                                    "No Internet. Data might not be up to date!",
                                    context);
                              } on Exception catch (e, s) {
                                print(s);
                              }
                              new Timer(new Duration(seconds: 2), () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.destination));
                              });
                            }
                          } else {
                            pinCodeController.pinController.clear();

                            CustomSnackBar.showMessage(
                                "error",
                                "Invalid Pin Code!",
                                pinCodeController.secondaryContext);
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    pinCodeController.redirectWidget,
                  ],
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
    return pinCodeController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.PinCode;
  }
}
