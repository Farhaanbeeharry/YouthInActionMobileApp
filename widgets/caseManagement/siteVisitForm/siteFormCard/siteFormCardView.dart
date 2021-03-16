import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/siteFormCard/siteFormCardController.dart';

class SiteFormCard extends StatefulWidget {
  final String title, subtitle, caseID;
  final Widget destination;

  const SiteFormCard(
      {this.title, this.subtitle, this.caseID, this.destination});

  @override
  _SiteFormCardState createState() => _SiteFormCardState();
}

class _SiteFormCardState extends State<SiteFormCard> with View<SiteFormCard> {
  SiteFormCardController siteFormCardController = new SiteFormCardController();

  @override
  Widget getBody() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: 95.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                const Radius.circular(24.0),
              )),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.64,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 26.0,
                    ),
                    Text(
                      widget.title,
                      style: siteFormCardTitle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.subtitle,
                      style: siteFormCardSubtitle,
                    ),
                  ],
                ),
              ),
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.2,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.destination));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 78.0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF4136F1),
                      radius: 20.0,
                      child: Icon(
                        Icons.chevron_right_rounded,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  @override
  Controller getController() {
    return siteFormCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.SiteFormCard;
  }
}
