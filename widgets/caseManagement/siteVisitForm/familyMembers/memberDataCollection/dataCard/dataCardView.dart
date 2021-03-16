import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardController.dart';

class DataCard extends StatefulWidget {
  final Widget childWidget;

  const DataCard({this.childWidget});

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> with View<DataCard> {
  DataCardController dataCardController = new DataCardController();

  @override
  Widget getBody() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        child: Container(
          height: 360.0,
          width: MediaQuery.of(context).size.width * 0.80,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              const Radius.circular(16.0),
            ),
          ),
          child: widget.childWidget,
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return dataCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.DataCard;
  }
}
