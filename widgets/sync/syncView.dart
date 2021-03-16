import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/sync/syncController.dart';

class SyncView extends StatefulWidget {
  @override
  _SyncViewState createState() => _SyncViewState();
}

class _SyncViewState extends State<SyncView> with View<SyncView> {
  SyncController syncController = new SyncController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      appBar: AppBar(
        toolbarHeight: 60.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "Sync",
          style: TextStyle(
              fontFamily: "Segoe UI Bold", fontSize: 24.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.0,
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
                    "Data Synchronization",
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
                "The following is done to ensure up-to-date and accurate data.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Segoe UI Semilight",
                    fontSize: 12.0,
                    color: Color(0xFF9499AA)),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Sync All Collected Data",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 26.0,
                color: Color(0xFF84B7EF),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/sync.png",
                width: MediaQuery.of(context).size.width * 0.67,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Click on \"Sync\" to sync data",
              style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: "Segoe UI",
                  color: Color(0xFFA1A1A1)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () async {
                  await syncController.syncData();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4136F1), Color(0xFF8743FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.syncAlt,
                          color: Colors.white,
                          size: 23.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Sync",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: 20.0,
                              color: Colors.white),
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
    return syncController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.Sync;
  }
}
