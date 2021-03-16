import 'package:flutter/cupertino.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/caseScheduleModel.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/schedule/scheduleCard/scheduleCardView.dart';

class ScheduleController extends Controller {
  List<Widget> scheduleWidgets = new List<Widget>();

  @override
  onReady() async {
    Common.workedCases = await DBProvider.db.getValueByKey("WorkedCases");
    Common.currentCases = await DBProvider.db.getValueByKey("CurrentCases");
    Common.nextCases = await DBProvider.db.getValueByKey("NextCases");
    loadWidgets();
  }

  loadWidgets() async {
    scheduleWidgets.clear();
    List<CaseSchedule> caseSchedules = new List<CaseSchedule>();
    caseSchedules = await DBProvider.db.getCaseSchedule();

    if (!checkAvailableSchedules(caseSchedules)) {
      view.callSetState(() {
        scheduleWidgets.add(emptySchedule(context));
      });
    } else {
      for (int i = 0; i < caseSchedules.length; i++) {
        if (caseSchedules[i].status == 1) {
          String date, month, time;

          date = caseSchedules[i].date[8] + caseSchedules[i].date[9];

          String monthInt = caseSchedules[i].date[5] + caseSchedules[i].date[6];
          int monthInteger = int.parse(monthInt);

          if (monthInteger == 1) {
            month = "Jan";
          } else if (monthInteger == 2) {
            month = "Feb";
          } else if (monthInteger == 3) {
            month = "Mar";
          } else if (monthInteger == 4) {
            month = "Apr";
          } else if (monthInteger == 5) {
            month = "May";
          } else if (monthInteger == 6) {
            month = "Jun";
          } else if (monthInteger == 7) {
            month = "Jul";
          } else if (monthInteger == 8) {
            month = "Aug";
          } else if (monthInteger == 9) {
            month = "Sep";
          } else if (monthInteger == 10) {
            month = "Oct";
          } else if (monthInteger == 11) {
            month = "Nov";
          } else if (monthInteger == 12) {
            month = "Dec";
          }

          time = caseSchedules[i].date[11] +
              caseSchedules[i].date[12] +
              caseSchedules[i].date[13] +
              caseSchedules[i].date[14] +
              caseSchedules[i].date[15];

          String peers = caseSchedules[i].peers.toString().substring(1);
          List<String> peerList = peers.split("/");

          view.callSetState(() {
            scheduleWidgets.add(ScheduleCard(
                name: caseSchedules[i].name,
                time: time,
                address: caseSchedules[i].address,
                date: date,
                month: month,
                status: caseSchedules[i].scheduleStatus,
                caseID: caseSchedules[i].fk_client_case_id.toString(),
                peers: peerList));
          });
        }
      }
    }
  }

  bool checkAvailableSchedules(List<CaseSchedule> caseSchedules) {
    bool valid = false;

    for (int i = 0; i < caseSchedules.length; i++) {
      if (caseSchedules[i].status == 1) valid = true;
    }
    return valid;
  }

  Widget emptySchedule(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/emptySchedule.png",
            width: MediaQuery.of(context).size.width * 0.67,
          ),
        ),
        SizedBox(
          height: 13.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "No current schedules...",
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
