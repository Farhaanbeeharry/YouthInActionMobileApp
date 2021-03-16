import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/otherDetailView/otherDetailController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class OtherDetail extends StatefulWidget {
  final Key formKey;

  const OtherDetail({this.formKey});

  @override
  _OtherDetailState createState() => _OtherDetailState();
}

class _OtherDetailState extends State<OtherDetail> with View<OtherDetail> {
  OtherDetailController otherDetailController = new OtherDetailController();

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
                height: 25.0,
              ),
              CustomTextField(
                promptText: "Marital Status",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.maritalStatusController,
              ),
              CustomTextField(
                promptText: "Number of Children (if any)",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.numberOfChildrenController,
              ),
              Text(
                "Police Record",
                style: dataCollectionCardTitle,
              ),
              Row(
                children: [
                  CircularCheckBox(
                    activeColor: Color(0xFF6B62FF),
                    value: TextControllers.criminalRecord,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: (value) {
                      callSetState(() {
                        TextControllers.criminalRecord =
                            !TextControllers.criminalRecord;
                      });
                    },
                  ),
                  Text(
                    "Have criminal record",
                    style: TextStyle(
                      fontFamily: "Segoe UI Light",
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Social Security",
                style: dataCollectionCardTitle,
              ),
              Row(
                children: [
                  CircularCheckBox(
                    activeColor: Color(0xFF6B62FF),
                    value: TextControllers.receivesPension,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: (value) {
                      callSetState(() {
                        TextControllers.receivesPension =
                            !TextControllers.receivesPension;
                      });
                    },
                  ),
                  Text(
                    "Receives pension",
                    style: TextStyle(
                      fontFamily: "Segoe UI Light",
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomTextField(
                  promptText: "State any social aid applied",
                  promptStyle: dataCollectionCardText,
                  inputStyle: dataCollectionCardTextFilled,
                  textEditingController: TextControllers.socialAidController),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return otherDetailController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.OtherDetail;
  }
}
