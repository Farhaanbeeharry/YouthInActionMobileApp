import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/displayMemberCard/displayMemberCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/academicQualificationView/academicQualificationView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/basicDetailView/basicDetailView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/contactDetailView/contactDetailView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/memberDataCollectionController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/otherDetailView/otherDetailView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/submitDataView/submitDataView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/workView/workView.dart';

class MemberDataCollectionView extends StatefulWidget {
  final String fullName, ageGroup;
  final int index;

  const MemberDataCollectionView({this.fullName, this.ageGroup, this.index});

  @override
  _MemberDataCollectionViewState createState() =>
      _MemberDataCollectionViewState();
}

class _MemberDataCollectionViewState extends State<MemberDataCollectionView>
    with View<MemberDataCollectionView> {
  MemberDataCollectionController memberDataCollectionController =
      new MemberDataCollectionController();

  @override
  Widget getBody() {
    memberDataCollectionController.index = widget.index;
    memberDataCollectionController.ageGroup = widget.ageGroup;

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Go back?'),
                content: Text(
                    'Are you sure you want to discard the changes and go back?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      return Future.value(false);
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      Navigator.pop(context);
                      return Future.value(true);
                    },
                    child: Text('Yes'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Go back?'),
                      content: Text(
                          'Are you sure you want to discard the changes and go back?'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('No'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            Navigator.pop(context);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  ) ??
                  false;
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          title: Text(
            "Family Members",
            style: TextStyle(
                fontFamily: "Segoe UI Bold",
                fontSize: 24.0,
                color: Colors.black),
          ),
        ),
        backgroundColor: Color(0xFFEBEBEB),
        body: SingleChildScrollView(
          child: Builder(
            builder: (BuildContext context) {
              memberDataCollectionController.secondaryContext = context;
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 14.0,
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
                      height: 14.0,
                    ),
                    DisplayMemberCard(
                      fullName: widget.fullName,
                      ageGroup: widget.ageGroup,
                    ),
                    Container(
                      height: 350.0,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFFEBEBEB),
                      child: CarouselSlider(
                        carouselController:
                            memberDataCollectionController.pageController,
                        options: CarouselOptions(
                            height: 360.0,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            onPageChanged: (index, value) {
                              memberDataCollectionController.checkControllers();
                            }),
                        items: <Widget>[
                          BasicDetail(),
                          ContactDetail(),
                          AcademicQualifications(),
                          Work(),
                          OtherDetail(),
                          SubmitForm()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return memberDataCollectionController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.MemberDataCollection;
  }
}
