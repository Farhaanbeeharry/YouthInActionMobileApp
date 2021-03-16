import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/siteVisitFormView.dart';
import 'package:yia/widgets/schedule/scheduleCard/scheduleCardController.dart';

class ScheduleCard extends StatefulWidget {
  final String name, time, date, month, address, caseID, status;
  final List<String> peers;

  const ScheduleCard(
      {this.name,
      this.time,
      this.date,
      this.month,
      this.address,
      this.caseID,
      this.status,
      this.peers});

  @override
  _ScheduleCardState createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> with View<ScheduleCard> {
  ScheduleCardController scheduleCardController = new ScheduleCardController();
  Color activeColor = Color(0xFF27C9EB);
  String activeText = "In Progress";

  @override
  Widget getBody() {
    if (widget.status == 0) {
      activeColor = scheduleCardController.stagingColor;
      activeText = scheduleCardController.stagingText;
    } else if (widget.status == 1) {
      activeColor = scheduleCardController.pendingColor;
      activeText = scheduleCardController.pendingText;
    } else if (widget.status == 2) {
      activeColor = scheduleCardController.inProgressColor;
      activeText = scheduleCardController.inProgressText;
    } else if (widget.status == 3) {
      activeColor = scheduleCardController.completeColor;
      activeText = scheduleCardController.completeText;
    } else if (widget.status == 4) {
      activeColor = scheduleCardController.cancelledColor;
      activeText = scheduleCardController.cancelledText;
    }

    scheduleCardController.peers = widget.peers;

    return Column(
      children: [
        InkWell(
          onTap: () {
            TextControllers.caseID = widget.caseID;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SiteVisitForm(
                          caseID: widget.caseID,
                        )));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 120.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(
                const Radius.circular(14.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.92 - 60,
                  height: 105.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        bottomLeft: Radius.circular(14.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontFamily: "Segoe UI Bold",
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              widget.time,
                              style: TextStyle(
                                fontFamily: "Segoe UI Light",
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          widget.address,
                          style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Container(
                              color: activeColor,
                              alignment: Alignment.center,
                              height: 22.0,
                              width: 90.0,
                              child: Text(
                                activeText,
                                style: TextStyle(
                                    fontFamily: "Segoe UI Bold",
                                    color: Colors.white,
                                    fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 22.0,
                              child: RaisedButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        color: Color(0xFF6b6b6b),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(40.0),
                                              topRight:
                                                  const Radius.circular(40.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 13.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  decoration: new BoxDecoration(
                                                    color: Color(0xFF636363),
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                      const Radius.circular(
                                                          20.0),
                                                    ),
                                                  ),
                                                  width: 120.0,
                                                  height: 7.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                              ),
                                              Column(
                                                children: scheduleCardController
                                                    .teamList,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.users,
                                        size: 13.0,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Team",
                                        style: TextStyle(
                                            fontFamily: "Segoe UI Bold",
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 60.0,
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4737F2),
                          Color(0xFF7E41FD),
                        ],
                        stops: [0.0, 0.7],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontFamily: "Segoe UI Bold",
                              fontSize: 23.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.month,
                            style: TextStyle(
                              fontFamily: "Segoe UI Light",
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }

  @override
  Controller getController() {
    return scheduleCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ScheduleCard;
  }
}
