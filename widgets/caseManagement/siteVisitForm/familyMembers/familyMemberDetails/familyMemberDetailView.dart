import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/familyMemberDetails/familyMemberDetailController.dart';

class FamilyMemberDetailView extends StatefulWidget {
  @override
  _FamilyMemberDetailViewState createState() => _FamilyMemberDetailViewState();
}

class _FamilyMemberDetailViewState extends State<FamilyMemberDetailView>
    with View<FamilyMemberDetailView> {
  FamilyMemberDetailController familyMemberDetailController =
      new FamilyMemberDetailController();

  @override
  Widget getBody() {
    return Scaffold();
  }

  @override
  Controller getController() {
    return familyMemberDetailController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.FamilyMemberDetail;
  }
}
