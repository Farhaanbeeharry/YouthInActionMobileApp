import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/ageGroupCard/ageGroupCardController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class AgeGroupCard extends StatefulWidget {
  final String name, ageGroup;
  final int index;
  final TextEditingController controller;

  const AgeGroupCard({this.name, this.index, this.ageGroup, this.controller});
  @override
  _AgeGroupCardState createState() => _AgeGroupCardState();
}

class _AgeGroupCardState extends State<AgeGroupCard> with View<AgeGroupCard> {
  AgeGroupCardController ageGroupCardController = new AgeGroupCardController();

  @override
  Widget getBody() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.88,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(50.0)),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 14.0,
                  ),
                  validator: (value) {},
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 35),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                    ),
                    labelText: 'Full Member Name...',
                    labelStyle: TextStyle(
                      fontFamily: "Segoe UI Semilight Italic",
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                width: 120.0,
                height: 48.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7066F5), Color(0xFF8743FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: TextControllers.ageGroups[widget.index],
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 30.0,
                    dropdownColor: Colors.white,
                    style: new TextStyle(
                      fontFamily: "Segoe UI Semilight ",
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value != "Age") {
                          ageGroupCardController.ageGroups.remove("Age");
                        }
                        TextControllers.ageGroups[widget.index] = value;
                      });
                    },
                    items: ageGroupCardController.ageGroups
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 14.0,
                            color: Color(0xFF272727),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  ageGroupCardController.removeMember(widget.index);
                },
                child: Icon(
                  FontAwesomeIcons.trashAlt,
                  color: Colors.red,
                  size: 25.0,
                ),
              )
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }

  @override
  Controller getController() {
    return ageGroupCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.AgeGroupCard;
  }
}
