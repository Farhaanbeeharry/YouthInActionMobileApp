import 'package:yia/common/BaseClass.dart';

class StateMonitor {
  //View intances
  static Map<InstanceNames, dynamic> _viewInstances = {};
  static dynamic getViewInstance(InstanceNames instanceName) {
    var instance = _viewInstances[instanceName];
    return instance == null ? false : instance;
  }

  static void safelyGetViewInstance<T extends View>(
      InstanceNames instanceName, Function(T) callback) {
    T instance = _viewInstances[instanceName];
    if (instance != null) {
      callback(instance);
    }
  }

  static bool addViewInstance(InstanceNames instanceName, dynamic instance) {
    // returns true if overridden
    var exists = getViewInstance(instanceName);
    _viewInstances[instanceName] = instance;
    return exists != false;
  }

  static bool removeViewInstance(InstanceNames instanceName) {
    // returns true if removed
    var exists = getViewInstance(instanceName);
    if (exists != false) {
      _viewInstances.remove(instanceName);
      return true;
    } else {
      return false;
    }
  }

  //controller instances
  static Map<InstanceNames, dynamic> _controllerInstances = {};
  static dynamic getControllerInstance(InstanceNames instanceName) {
    var instance = _controllerInstances[instanceName];
    return instance == null ? false : instance;
  }

  static void safelyGetControllerInstance<T extends Controller>(
      InstanceNames instanceName, Function(T) callback) {
    T instance = _controllerInstances[instanceName];
    if (instance != null) {
      callback(instance);
    }
  }

  static bool addControllerInstance(
      InstanceNames instanceName, dynamic instance) {
    // returns true if overridden
    var exists = getControllerInstance(instanceName);
    _controllerInstances[instanceName] = instance;
    return exists != false;
  }

  static bool removeControllerInstance(InstanceNames instanceName) {
    // returns true if removed
    var exists = getControllerInstance(instanceName);
    if (exists != false) {
      _controllerInstances.remove(instanceName);
      return true;
    } else {
      return false;
    }
  }
}

enum InstanceNames {
  CustomTextField,
  CustomNumberField,
  Login,
  ChangePassword,
  ForgetPassword,
  ForgotPasswordSuccess,
  SiteFormCard,
  SiteVisitForm,
  FamilySize,
  AgeGroupCard,
  FamilyMember,
  FamilyMemberCard,
  FamilyMemberDetail,
  MemberDataCollection,
  DisplayMemberCard,
  DataCard,
  BasicDetail,
  ContactDetail,
  AcademicQualifications,
  Work,
  OtherDetail,
  SubmitData,
  PinCode,
  Schedule,
  ScheduleCard,
  HomePage,
  Sync,
  LogOut,
  Request,
  RequestCard,
  Team,
  LogOutSuccess,
  SubmitForm,
  TeamMemberCard,
  ClaimAndHistory,
  SetLocation,
  SubmitDataLocally
}
