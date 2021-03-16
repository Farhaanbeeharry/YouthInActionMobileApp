import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/claimAndHistory/claimAndHistoryController.dart';

class ClaimAndHistory extends StatefulWidget {
  @override
  _ClaimAndHistoryState createState() => _ClaimAndHistoryState();
}

class _ClaimAndHistoryState extends State<ClaimAndHistory>
    with View<ClaimAndHistory> {
  ClaimAndHistoryController claimAndHistoryController =
      new ClaimAndHistoryController();

  @override
  Widget getBody() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              )),
              Tab(
                  icon: Icon(
                Icons.sticky_note_2,
                color: Colors.black,
              )),
              Tab(
                  icon: Icon(
                Icons.pin_drop,
                color: Colors.black,
              )),
            ],
          ),
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
            "Claim and History",
            style: TextStyle(
                fontFamily: "Segoe UI Bold",
                fontSize: 24.0,
                color: Colors.black),
          ),
        ),
        body: TabBarView(
          children: [
            Icon(
              Icons.directions_car,
              color: Colors.black,
            ),
            Scaffold(
              backgroundColor: Color(0xFFEBEBEB),
              body: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35.0,
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: Color(0xFFd9d9d9),
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(16.0),
                              topRight: const Radius.circular(16.0),
                            ),
                          ),
                          width: double.infinity,
                          height: 60.0,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                "Notes",
                                style: TextStyle(
                                    fontFamily: "Segoe UI Bold",
                                    fontSize: 24.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          color: Colors.white,
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            style: dataCollectionCardTextFilled,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 25),
                                border: new OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                ),
                                labelText: "Type your notes here...",
                                labelStyle: dataCollectionCardText),
                            autofocus: false,
                            maxLines: null,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              claimAndHistoryController.note =
                                  claimAndHistoryController.noteController.text;
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4136F1),
                                      Color(0xFF8743FF)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Save Note",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Segoe UI Light",
                                      fontSize: 20.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return claimAndHistoryController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ClaimAndHistory;
  }
}
