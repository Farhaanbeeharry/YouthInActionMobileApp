import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/academicQualificationView/academicQualificationController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class AcademicQualifications extends StatefulWidget {
  final Key formKey;

  const AcademicQualifications({this.formKey});

  @override
  _AcademicQualificationsState createState() => _AcademicQualificationsState();
}

class _AcademicQualificationsState extends State<AcademicQualifications>
    with View<AcademicQualifications> {
  AcademicQualificationsController academicQualificationsController =
      new AcademicQualificationsController();

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
                "Education",
                style: dataCollectionCardTitle,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                promptText: "Level of qualifications",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.qualificationLevelController,
              ),
              SizedBox(
                height: 7.0,
              ),
              CustomTextField(
                promptText: "Year of qualifications",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.qualificationYearController,
              ),
              SizedBox(
                height: 7.0,
              ),
              CustomTextField(
                promptText: "College/High school",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.schoolController,
              ),
              SizedBox(
                height: 7.0,
              ),
              CustomTextField(
                  promptText: "University",
                  promptStyle: dataCollectionCardText,
                  inputStyle: dataCollectionCardTextFilled,
                  textEditingController: TextControllers.universityController),
              SizedBox(
                height: 7.0,
              ),
              CustomTextField(
                  promptText: "Skills",
                  promptStyle: dataCollectionCardText,
                  inputStyle: dataCollectionCardTextFilled,
                  textEditingController: TextControllers.skillController),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return academicQualificationsController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.AcademicQualifications;
  }
}
