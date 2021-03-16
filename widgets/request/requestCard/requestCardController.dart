import 'package:flutter/cupertino.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/request/requestController.dart';
import 'package:yia/widgets/request/teamMemberCard/teamMemberCard.dart';

class RequestCardController extends Controller {
  List<Widget> widgets = new List<Widget>();
  List<Widget> teamList = new List<Widget>();
  List<String> peers = new List<String>();
  String caseID;

  @override
  onReady() {
    for (int i = 0; i < peers.length; i++) {
      teamList.add(TeamMemberCard(name: peers[i]));
    }
  }

  saveResponse(bool accepted) async {
    if (accepted) {
      await DBProvider.db.updateCaseRequest(caseID, 1);

      StateMonitor.safelyGetControllerInstance<RequestController>(
          InstanceNames.Request, (requestController) {
        requestController.loadWidgets();
      });
    } else {
      await DBProvider.db.updateCaseRequest(caseID, 2);
      StateMonitor.safelyGetControllerInstance<RequestController>(
          InstanceNames.Request, (requestController) {
        requestController.loadWidgets();
      });
    }
  }
}
