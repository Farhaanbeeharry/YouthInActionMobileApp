import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/request/teamMemberCard/teamMemberCardController.dart';

class TeamMemberCard extends StatefulWidget {
  final String name;

  const TeamMemberCard({this.name});

  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard>
    with View<TeamMemberCard> {
  TeamMemberCardController teamMemberCardController =
      TeamMemberCardController();

  @override
  Widget getBody() {
    teamMemberCardController.loadInitial(widget.name);
    teamMemberCardController.selectedColor =
        randomChoice(teamMemberCardController.colors);
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60.0,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: teamMemberCardController.selectedColor,
                child: Text(
                  teamMemberCardController.initial,
                  style: TextStyle(
                    fontFamily: "Segoe UI Bold",
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 16.0,
                    color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  @override
  Controller getController() {
    return teamMemberCardController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.TeamMemberCard;
  }
}
