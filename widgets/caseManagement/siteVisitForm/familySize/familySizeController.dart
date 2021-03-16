import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/beneficiaryModel.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/ageGroupCard/ageGroupCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class FamilySizeController extends Controller {
  BuildContext secondaryContext;
  List<Widget> familyWidgets = new List<Widget>();
  String newAgeGroup = "Age";

  @override
  onReady() async {
    this.loadWidgets();
  }

  removeMember(int index) {
    CommonSiteVisit.beneficiaries.removeAt(index);
    familyWidgets.removeAt(index);
    TextControllers.familySizeControllers.removeAt(index);
    TextControllers.ageGroups.removeAt(index);
    loadWidgets();
  }

  loadWidgets() {
    familyWidgets.clear();
    view.callSetState(() {
      if (CommonSiteVisit.beneficiaries.isEmpty) {
        familyWidgets.add(emptyFamily(context));
      } else {
        for (int i = 0; i < CommonSiteVisit.beneficiaries.length; i++) {
          familyWidgets.add(AgeGroupCard(
            controller: TextControllers.familySizeControllers[i],
            index: i,
          ));
        }
      }
    });
  }

  addMember() {
    if (CommonSiteVisit.beneficiaries.isEmpty) familyWidgets.clear();
    TextEditingController controller = new TextEditingController();

    CommonSiteVisit.beneficiaries.add(Beneficiary());
    TextControllers.familySizeControllers.add(controller);
    TextControllers.ageGroups.add(newAgeGroup);

    int index = CommonSiteVisit.beneficiaries.length - 1;
    view.callSetState(() {
      familyWidgets.add(AgeGroupCard(controller: controller, index: index));
    });
  }

  Future<bool> saveToModel() async {
    bool valid = true;
    String msg = "";

    for (int i = 0; i < TextControllers.familySizeControllers.length; i++) {
      if (TextControllers.familySizeControllers[i].text.isEmpty) {
        valid = false;
        msg = "Name cannot be empty !";
      } else if (TextControllers.familySizeControllers[i].text
              .split(" ")
              .length !=
          2) {
        valid = false;
        msg = "Must have 2 names !";
      }
    }

    for (var x in TextControllers.ageGroups) {
      if (x == "Age" || x == "null" || x == null) {
        valid = false;
        msg = "Age group cannot be empty";
      }
    }

    if (valid) {
      for (int i = 0; i < CommonSiteVisit.beneficiaries.length; i++) {
        CommonSiteVisit.beneficiaries[i].ageing = TextControllers.ageGroups[i];
        List<String> names =
            TextControllers.familySizeControllers[i].text.split(" ");
        CommonSiteVisit.beneficiaries[i].first_name = names[0];
        CommonSiteVisit.beneficiaries[i].last_name = names[1];
        CommonSiteVisit.beneficiaries[i].fk_case_id = TextControllers.caseID;
        await DBProvider.db.addFamilyMember(CommonSiteVisit.beneficiaries[i]);
      }
      return true;
    } else {
      CustomSnackBar.showMessage("error", msg, secondaryContext);
      return false;
    }
  }

  Widget emptyFamily(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/emptyList.png",
            width: MediaQuery.of(context).size.width * 0.67,
          ),
        ),
        SizedBox(
          height: 13.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "It's still empty here...",
            style: TextStyle(
              fontFamily: "Segoe UI Italic",
              fontSize: 22.0,
              color: Color(0xFF272727),
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
