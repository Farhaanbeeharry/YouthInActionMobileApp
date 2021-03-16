import 'package:yia/common/BaseReturnType.dart';

class LoginModel extends ReturnModel {
  String firstName;
  String lastName;
  String userToken;
  String sessionToken;

  LoginModel cast(Map<String, dynamic> json) {
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.userToken = json['userToken'];
    this.sessionToken = json['sessionToken'];
    return this;
  }
}
