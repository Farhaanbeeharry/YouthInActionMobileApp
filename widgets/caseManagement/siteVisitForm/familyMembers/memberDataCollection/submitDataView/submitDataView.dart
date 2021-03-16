import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/submitDataView/submitDataController.dart';

class SubmitForm extends StatefulWidget {
  final Key formKey;

  SubmitForm({this.formKey});

  @override
  _SubmitFormState createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> with View<SubmitForm> {
  SubmitFormController submitFormController = new SubmitFormController();
  @override
  Widget getBody() {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/submitData.png",
              width: MediaQuery.of(context).size.width * 0.55,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            child: Text(
              "By submitting this form, I hereby acknowledge that the given information should remain confidential.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontFamily: "Segoe UI Semilight",
                fontSize: 10.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularCheckBox(
                activeColor: Color(0xFF6B62FF),
                value: submitFormController.agreement,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (value) {
                  callSetState(() {
                    submitFormController.agreement =
                        !submitFormController.agreement;
                  });
                },
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'I agree to the terms and conditions by Youth in Action',
                style: TextStyle(
                  fontFamily: "Segoe UI Semilight",
                  fontSize: 10.0,
                  color: Color(0xFF7B7B7B),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.center,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                submitFormController.buttonClick();
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
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                      minHeight: 50.0),
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
        ],
      ),
    );
  }

  @override
  Controller getController() {
    return submitFormController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.SubmitForm;
  }
}
