import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/widgets/request/teamMemberCard/teamMemberCard.dart';

class ScheduleCardController extends Controller {
  Color stagingColor = Color(0xFFafad45);
  String stagingText = "Staging";

  Color pendingColor = Color(0xFF4576af);
  String pendingText = "Pending";

  Color inProgressColor = Color(0xFF45af52);
  String inProgressText = "In Progress";

  Color completeColor = Color(0xFF17C1C1);
  String completeText = "Complete";

  Color cancelledColor = Color(0xFF979797);
  String cancelledText = "Cancelled";

  List<Widget> teamList = new List<Widget>();
  List<String> peers = new List<String>();

  @override
  onReady() {
    view.callSetState(() {
      for (int i = 0; i < peers.length; i++) {
        teamList.add(TeamMemberCard(name: peers[i]));
      }
    });
  }
}
