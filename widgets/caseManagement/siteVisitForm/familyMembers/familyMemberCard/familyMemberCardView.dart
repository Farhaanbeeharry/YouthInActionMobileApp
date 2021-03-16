import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/familyMemberCard/familyMemberCardController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/memberDataCollectionView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class FamilyMemberCard extends StatefulWidget {
  final String fullName, ageGroup;
  final int index;

  const FamilyMemberCard({this.fullName, this.ageGroup, this.index});

  @override
  _FamilyMemberCardState createState() => _FamilyMemberCardState();
}

class _FamilyMemberCardState extends State<FamilyMemberCard>
    with View<FamilyMemberCard> {
  FamilyMemberCardController siteFormCardController =
      new FamilyMemberCardController();

  @override
  Widget getBody() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: 95.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                const Radius.circular(24.0),
              )),
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
                      height: 26.0,
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
                child: InkWell(
                  onTap: () {
                    TextControllers.clearTextControllers();
                    TextControllers.loadTextControllers(
                        CommonSiteVisit.beneficiaries[widget.index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemberDataCollectionView(
                                  fullName: widget.fullName,
                                  ageGroup: widget.ageGroup,
                                  index: widget.index,
                                )));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 78.0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF4136F1),
                      radius: 20.0,
                      child: Icon(
                        Icons.chevron_right_rounded,
                        size: 25.0,
                        color: Colors.white,
                      ),
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
    return siteFormCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.FamilyMemberCard;
  }
}
