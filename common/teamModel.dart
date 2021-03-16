import 'package:yia/common/BaseReturnType.dart';

class Team extends ReturnModel {
  dynamic first_name, last_name;

  Team({this.first_name, this.last_name});

  @override
  ReturnModel cast(Map<String, dynamic> json) {
    this.first_name = json['first_name'];
    this.last_name = json['last_name'];
    return this;
  }
}
