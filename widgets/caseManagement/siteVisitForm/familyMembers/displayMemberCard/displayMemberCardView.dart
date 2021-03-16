import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/displayMemberCard/displayMemberCardController.dart';

class DisplayMemberCard extends StatefulWidget {
  final String fullName, ageGroup;

  const DisplayMemberCard({this.fullName, this.ageGroup});

  @override
  _FamilyMemberCardState createState() => _FamilyMemberCardState();
}

class _FamilyMemberCardState extends State<DisplayMemberCard>
    with View<DisplayMemberCard> {
  DisplayMemberCardController displayMemberCardController =
      new DisplayMemberCardController();

  @override
  Widget getBody() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: 75.0,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              const Radius.circular(24.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.64,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      widget.fullName,
                      style: siteFormCardTitle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.ageGroup,
                      style: siteFormCardSubtitle,
                    ),
                  ],
                ),
              ),
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 78.0,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF4136F1),
                    radius: 20.0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  @override
  Controller getController() {
    return displayMemberCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.DisplayMemberCard;
  }
}
