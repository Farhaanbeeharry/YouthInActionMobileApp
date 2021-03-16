import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/basicDetailView/basicDetailController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardView.dart';

import '../textControllers.dart';

class BasicDetail extends StatefulWidget {
  final Key formKey;

  const BasicDetail({this.formKey});

  @override
  _BasicDetailState createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> with View<BasicDetail> {
  BasicDetailController basicDetailController = new BasicDetailController();

  int genderIndex;

  @override
  Widget getBody() {
    if (TextControllers.gender == "male") {
      genderIndex = 0;
    } else if (TextControllers.gender == "female") {
      genderIndex = 1;
    }

    if (TextControllers.dateOfBirth == "null") {
      basicDetailController.promptDate = "Pick";
      basicDetailController.promptDateOfBirth = " Date of Birth: ";
    } else {
      basicDetailController.promptDate = "";
      basicDetailController.promptDateOfBirth = TextControllers.dateOfBirth;
    }

    return DataCard(
      childWidget: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 35.0,
        ),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Basic Details",
                style: dataCollectionCardTitle,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                promptText: "First Name",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.firstNameController,
              ),
              CustomTextField(
                promptText: "Last Name",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.lastNameController,
              ),
              Container(
                alignment: Alignment.center,
                // child: CustomRadioButton(
                //   buttonLables: basicDetailController.genderList,
                //   buttonValues: basicDetailController.genderList,
                //   initialSelection: genderIndex,
                //   radioButtonValue: (value, index) {
                //     TextControllers.gender = value;
                //   },
                //   horizontal: true,
                //   enableShape: true,
                //   buttonSpace: 5,
                //
                //   buttonColor: Colors.white,
                //   selectedColor: Color(0xFF0FF4136F1),
                //   //buttonWidth: 150,
                // ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    CircularCheckBox(
                      activeColor: Color(0xFF6B62FF),
                      value: basicDetailController.male,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (value) {
                        callSetState(() {
                          basicDetailController.male =
                              !basicDetailController.male;
                          basicDetailController.female =
                              !basicDetailController.female;

                          if (basicDetailController.male &&
                              !basicDetailController.female) {
                            TextControllers.gender = "male";
                          } else if (basicDetailController.female &&
                              !basicDetailController.male) {
                            TextControllers.gender = "female";
                          }
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 13.0,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    CircularCheckBox(
                      activeColor: Color(0xFF6B62FF),
                      value: basicDetailController.female,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (value) {
                        callSetState(() {
                          basicDetailController.male =
                              !basicDetailController.male;
                          basicDetailController.female =
                              !basicDetailController.female;

                          if (basicDetailController.male &&
                              !basicDetailController.female) {
                            TextControllers.gender = "male";
                          } else if (basicDetailController.female &&
                              !basicDetailController.male) {
                            TextControllers.gender = "female";
                          }
                        });
                      },
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 13.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                promptText: "National ID No.",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.nationalIDController,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        basicDetailController.promptDate,
                        style: TextStyle(
                            fontFamily: "Segoe UI Light Italic",
                            fontSize: 14.0),
                      ),
                      Text(
                        basicDetailController.promptDateOfBirth,
                        style: TextStyle(
                            fontFamily: "Segoe UI Italic", fontSize: 14.0),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            basicDetailController.selectDate(context);
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
                                    maxWidth: 50.0, minHeight: 40.0),
                                alignment: Alignment.center,
                                child: Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: Colors.white,
                                  size: 20.0,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return basicDetailController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.BasicDetail;
  }
}
