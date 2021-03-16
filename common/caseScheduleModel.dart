import 'package:yia/common/BaseReturnType.dart';

class CaseSchedule extends ReturnModel {
  dynamic id,
      fk_client_case_id,
      date,
      status,
      min_user,
      notes,
      address,
      open_date,
      close_date,
      user_name,
      phone,
      schedule_date,
      name,
      scheduleStatus,
      fk_location_id,
      fk_schedule_id,
      fk_user_id,
      scheduleUserID,
      scheduleID,
      peers;

  @override
  ReturnModel cast(Map<String, dynamic> json) {
    this.id = json['id'];
    this.fk_client_case_id = json['fk_client_case_id'];
    this.date = json['date'];
    this.status = json['status'];
    this.min_user = json['min_user'];
    this.notes = json['notes'];
    this.address = json['address'];
    this.open_date = json['open_date'];
    this.scheduleStatus = json['scheduleStatus'];
    this.close_date = json['close_date'];
    this.user_name = json['user_name'];
    this.phone = json['phone'];
    this.schedule_date = json['schedule_date'];
    this.name = json['name'];
    this.fk_location_id = json['fk_location_id'];
    this.fk_schedule_id = json['fk_schedule_id'];
    this.fk_user_id = json['fk_user_id'];
    this.scheduleUserID = json['scheduleUserID'];
    this.scheduleID = json['scheduleID'];
    this.peers = json['peers'];
    return this;
  }
}
