import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/claimAndHistory/claimAndHistoryView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/familyMemberView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familySize/familySizeView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/siteFormCard/siteFormCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/siteVisitFormController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/submitData/submitDataView.dart';

class SiteVisitForm extends StatefulWidget {
  final String caseID;

  const SiteVisitForm({this.caseID});

  @override
  _SiteVisitFormState createState() => _SiteVisitFormState();
}

class _SiteVisitFormState extends State<SiteVisitForm>
    with View<SiteVisitForm> {
  SiteVisitFormController siteVisitFormController =
      new SiteVisitFormController();

  @override
  void initState() {
    super.initState();
    CommonSiteVisit.beneficiaries.clear();
    TextControllers.ageGroups.clear();
    TextControllers.familySizeControllers.clear();
    siteVisitFormController.setCaseID(widget.caseID);
  }

  @override
  Widget getBody() {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        await siteVisitFormController.updateDB();
        TextControllers.clearTextControllers();
        CommonSiteVisit.beneficiaries.clear();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () async {
              await siteVisitFormController.updateDB();
              TextControllers.clearTextControllers();
              CommonSiteVisit.beneficiaries.clear();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          title: Text(
            "Site-Visit Form",
            style: TextStyle(
                fontFamily: "Segoe UI Bold",
                fontSize: 24.0,
                color: Colors.black),
          ),
        ),
        backgroundColor: Color(0xFFEBEBEB),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 21.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.shieldAlt,
                        color: Color(0xFF1BC23C),
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Data Collection",
                        style: TextStyle(
                          fontFamily: "Segoe UI Semilight",
                          fontSize: 22.0,
                          color: Color(0xFF9499AA),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: Text(
                    "The following personal data is considered 'sensitive' and is subject to specific processing conditions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Segoe UI Semilight",
                        fontSize: 12.0,
                        color: Color(0xFF9499AA)),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SiteFormCard(
                  title: "Claim and History",
                  subtitle: "Pictures, Notes, etc...",
                  destination: ClaimAndHistory(),
                ),
                SiteFormCard(
                  title: "Family Size",
                  subtitle: "Family Member List",
                  destination: FamilySizeView(),
                ),
                SiteFormCard(
                  title: "Family Member Profile",
                  subtitle: "Details about each family member",
                  destination: FamilyMemberView(),
                ),
                SiteFormCard(
                  title: "Submit Form",
                  subtitle: "Save Data (Locally)",
                  destination: SubmitDataView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return siteVisitFormController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.SiteVisitForm;
  }
}
