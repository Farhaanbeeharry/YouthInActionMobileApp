import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/workView/workController.dart';

class Work extends StatefulWidget {
  final Key formKey;

  const Work({this.formKey});
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> with View<Work> {
  WorkController workController = new WorkController();

  @override
  Widget getBody() {
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
                height: 15.0,
              ),
              Text(
                "Work",
                style: dataCollectionCardTitle,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Previous Workplace (if any)",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.previousWorkController,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(50.0)),
                    ),
                    child: TextFormField(
                      controller: TextControllers.fromYearController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: dataCollectionCardTextFilled,
                      validator: (value) {
                        // return FormFieldValidator.validateData(value, widget.promptText);
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          contentPadding: EdgeInsets.only(left: 20),
                          border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          labelText: "From Year",
                          labelStyle: dataCollectionCardText),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(50.0)),
                    ),
                    child: TextFormField(
                      controller: TextControllers.toYearController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: dataCollectionCardTextFilled,
                      validator: (value) {
                        // return FormFieldValidator.validateData(value, widget.promptText);
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          contentPadding: EdgeInsets.only(left: 20),
                          border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          labelText: "To Year",
                          labelStyle: dataCollectionCardText),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                promptText: "Working Capabilities",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.workingCapabilitiesController,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                  promptText: "Current Workplace (if any)",
                  promptStyle: dataCollectionCardText,
                  inputStyle: dataCollectionCardTextFilled,
                  textEditingController:
                      TextControllers.currentWorkPlaceController),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Role at Current Workplace",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.roleAtCurrentWorkPlaceController,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return workController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.Work;
  }
}
