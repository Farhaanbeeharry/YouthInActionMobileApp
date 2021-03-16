import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/request/requestController.dart';

class RequestView extends StatefulWidget {
  @override
  _RequestViewState createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> with View<RequestView> {
  RequestController requestController = new RequestController();

  @override
  Widget getBody() {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      appBar: AppBar(
        toolbarHeight: 60.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "Notifications",
          style: TextStyle(
              fontFamily: "Segoe UI Bold", fontSize: 24.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Case Request",
                    style: TextStyle(
                      fontFamily: "Segoe UI Bold",
                      fontSize: 17.0,
                      color: Color(0xFF676666),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      width: 50.0,
                      color: Color(0xFF676666),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: requestController.requestWidgets,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return requestController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.Request;
  }
}
