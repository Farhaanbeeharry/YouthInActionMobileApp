import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';

class TeamMemberCardController extends Controller {
  Color selectedColor;
  List<Color> colors = [
    Color(0xFF403826),
    Color(0xFF7b836a),
    Color(0xFFf25a38),
    Color(0xFFf2a922),
    Color(0xFF024059),
    Color(0xFFd94395),
    Color(0xFFf25e5e),
    Color(0xFF04bf9d),
    Color(0xFF04bfbf),
    Color(0xFFf29544),
    Color(0xFF63aebf),
    Color(0xFFf23d3d),
    Color(0xFFf25c05),
    Color(0xFFff3b3b),
    Color(0xFFee3955),
    Color(0xFFff8202),
    Color(0xFF0091a0),
    Color(0xFF002f61),
    Color(0xFF9dd227),
    Color(0xFFf66d81),
    Color(0xFFff4272),
    Color(0xFF493267),
    Color(0xFF373854),
  ];
  String initial;

  loadInitial(String name) {
    List<String> names = name.split(" ");
    initial = names[0][0] + names[1][0];
  }
}
