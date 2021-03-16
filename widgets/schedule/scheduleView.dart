import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/schedule/scheduleController.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> with View<ScheduleView> {
  ScheduleController scheduleController = new ScheduleController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "My Schedule",
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
              Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: 125.0,
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9FA6FF),
                        Color(0xFF9495F1),
                        Color(0xFFE26BEF),
                      ],
                      stops: [0.0, 0.2, 0.6],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35.0,
                          ),
                          Text(
                            "Next Visit in",
                            style: TextStyle(
                              fontFamily: "Segoe UI Bold",
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "2 Days 23h 52m",
                            style: TextStyle(
                              fontFamily: "Segoe UI Bold",
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          Common.workedCases,
                          style: TextStyle(
                            fontFamily: "Segoe UI Bold",
                            fontSize: 40.0,
                            color: Color(0xFF0BD677),
                          ),
                        ),
                        Text(
                          "Worked Cases",
                          style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 10.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Column(
                      children: [
                        Text(
                          Common.currentCases,
                          style: TextStyle(
                            fontFamily: "Segoe UI Bold",
                            fontSize: 40.0,
                            color: Color(0xFF9C90F0),
                          ),
                        ),
                        Text(
                          "Current Cases",
                          style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 10.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Column(
                      children: [
                        Text(
                          Common.nextCases,
                          style: TextStyle(
                            fontFamily: "Segoe UI Bold",
                            fontSize: 40.0,
                            color: Color(0xFFFFA200),
                          ),
                        ),
                        Text(
                          "Next Cases",
                          style: TextStyle(
                            fontFamily: "Segoe UI Semilight",
                            fontSize: 10.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: scheduleController.scheduleWidgets,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return scheduleController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.Schedule;
  }
}
