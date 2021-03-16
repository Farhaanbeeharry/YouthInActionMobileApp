import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/familyMemberCard/familyMemberCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familySize/familySizeView.dart';

class FamilyMemberController with Controller {
  List<Widget> familyMembers = new List<Widget>();

  @override
  onReady() {
    this.loadWidgets();
  }

  loadWidgets() {
    if (CommonSiteVisit.beneficiaries.isEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FamilySizeView()));
    } else {
      view.callSetState(() {
        for (int i = 0; i < CommonSiteVisit.beneficiaries.length; i++) {
          String fullName = CommonSiteVisit.beneficiaries[i].first_name +
              " " +
              CommonSiteVisit.beneficiaries[i].last_name;
          familyMembers.add(FamilyMemberCard(
              fullName: fullName,
              ageGroup: CommonSiteVisit.beneficiaries[i].ageing,
              index: i));
        }
      });
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
