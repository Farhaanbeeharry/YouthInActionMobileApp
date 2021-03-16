import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familySize/familySizeController.dart';

class FamilySizeView extends StatefulWidget {
  @override
  _FamilySizeViewState createState() => _FamilySizeViewState();
}

class _FamilySizeViewState extends State<FamilySizeView>
    with View<FamilySizeView> {
  FamilySizeController familySizeController = new FamilySizeController();

  //ici bizin met loadWidgets() on ready

  @override
  Widget getBody() {
    return WillPopScope(
      onWillPop: () async {
        if (await familySizeController.saveToModel()) {
          Navigator.pop(context);
          return Future.value(true);
        } else
          return Future.value(false);
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () async {
                if (await familySizeController.saveToModel()) {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: Colors.black,
                size: 30.0,
              ),
            ),
            title: Text(
              "Family Size",
              style: TextStyle(
                  fontFamily: "Segoe UI Bold",
                  fontSize: 24.0,
                  color: Colors.black),
            ),
          ),
          backgroundColor: Color(0xFFEBEBEB),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 28.0,
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
                          "Data Collection",
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
                      "The following personal data is considered 'sensitive' and is subject to specific processing conditions.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Segoe UI Semilight",
                          fontSize: 12.0,
                          color: Color(0xFF9499AA)),
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Column(
                    children: familySizeController.familyWidgets,
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      familySizeController.secondaryContext = context;
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32.0,
                            ),
                            Container(
                              height: 70.0,
                              width: 70.0,
                              child: RaisedButton(
                                onPressed: () {
                                  familySizeController.addMember();
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Text(
                                "Add Family Member",
                                style: TextStyle(
                                  fontFamily: "Segoe UI Semilight",
                                  fontSize: 18.0,
                                  color: Color(0xFF272727),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return familySizeController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.FamilySize;
  }
}
