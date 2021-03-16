class ApiUrl {
  static const String baseURL = "https://normium.com/yia/api/public/index.php/";

  static const String LOGIN = baseURL + "user/login";
  static const String CHANGEPASSWORD = baseURL + "user/changePassword";
  static const String FORGOTPASSWORD = baseURL + "user/forgotPassword";

  static const String GETMOBILECOUNT = baseURL + "casemobile/getMobileCount";

  static const String SETBENEFICIARY = baseURL + "beneficiary/OPRQuery";

  static const String CASESCHEDULE = baseURL + "casemobile/getAll";
  static const String GETBENEFICIARIES =
      baseURL + "casemobile/getAllBeneficiaries";

  static const String SETUSERLOCATION = baseURL + "usermobile/setUserLocation";
}
