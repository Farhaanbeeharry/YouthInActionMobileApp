import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/familyMemberController.dart';

class FamilyMemberView extends StatefulWidget {
  @override
  _FamilyMemberViewState createState() => _FamilyMemberViewState();
}

class _FamilyMemberViewState extends State<FamilyMemberView>
    with View<FamilyMemberView> {
  FamilyMemberController familyMemberController = new FamilyMemberController();

  @override
  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        title: Text(
          "Family Members",
          style: TextStyle(
              fontFamily: "Segoe UI Bold", fontSize: 24.0, color: Colors.black),
        ),
      ),
      backgroundColor: Color(0xFFEBEBEB),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 28.0,
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
                height: 18.0,
              ),
              Column(
                children: familyMemberController.familyMembers,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return familyMemberController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.FamilyMember;
  }
}
