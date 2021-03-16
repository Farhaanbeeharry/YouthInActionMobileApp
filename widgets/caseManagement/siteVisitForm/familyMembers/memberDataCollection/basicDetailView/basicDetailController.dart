import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class BasicDetailController extends Controller {
  String defaultDisplayDate = "Date of Birth: ";
  String promptDate = "Pick";
  String promptDateOfBirth = " Date of Birth: ";
  bool male = true;
  bool female = false;
  String gender;

  @override
  onReady() {
    gender = TextControllers.gender;
    view.callSetState(() {
      if (gender == "male") {
        male = true;
        female = false;
      } else if (gender == "female") {
        male = false;
        female = true;
      }
    });
  }

  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      view.callSetState(() {
        promptDate = "";
        selectedDate = picked;
        String displayDate =
            defaultDisplayDate + selectedDate.toString().substring(0, 10);
        promptDateOfBirth = displayDate;
        TextControllers.dateOfBirth = selectedDate.toString().substring(0, 10);
      });
  }
}
