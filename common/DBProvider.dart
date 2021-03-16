import 'dart:async';
import 'dart:io';

import 'package:flutter_guid/flutter_guid.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yia/common/beneficiaryModel.dart';
import 'package:yia/common/caseScheduleModel.dart';
import 'package:yia/common/keyValueModel.dart';

class DBProvider {
  DBProvider._();
  static String keyValueTable = "KeyValue";
  static String clientCaseTable = "client_case";
  static String scheduleTable = "schedule";
  static String beneficiaryTable = "beneficiary";
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "YIA.db");
    return await openDatabase(
      path,
      version: 1,
    );
  }

  checkTable(String tableName) async {
    final db = await database;
    var res = await db.query(tableName);
    print(res);
  }

  initialiseDB() async {
    await initialiseKeyValueTable();
    await initialiseBeneficiaryTable();
    await initialiseCaseScheduleTable();
  }

  initialiseKeyValueTable() async {
    final db = await database;
    await db.execute("CREATE TABLE IF NOT EXISTS KeyValue ("
        "id TEXT PRIMARY KEY,"
        "key TEXT,"
        "value TEXT"
        ")");

    await newKeyValue("PinCode", "0000");
    await newKeyValue("RememberMe", "false");
    await newKeyValue("EmailAddress", "null");
    await newKeyValue("Password", "null");
    await newKeyValue("UserToken", "null");
    await newKeyValue("SessionToken", "null");
    await newKeyValue("DeviceToken", "null");
    await newKeyValue("WorkedCases", "0");
    await newKeyValue("NextCases", "0");
    await newKeyValue("CurrentCases", "0");
  }

  newKeyValue(String key, String value) async {
    if (await checkExistingKey(key) == false) {
      KeyValue newKeyValue = new KeyValue();
      newKeyValue.key = key;
      newKeyValue.value = value;
      addNewKeyValue(newKeyValue);
    }
  }

  addNewKeyValue(KeyValue newKeyValue) async {
    final db = await database;
    var res = await db.rawInsert("INSERT Into KeyValue (id, key, value)"
        " VALUES ('${Guid.newGuid}','${newKeyValue.key}', '${newKeyValue.value}')");
    return res;
  }

  resetKeyValueTable() async {
    await dropTable("KeyValue");
    await initialiseKeyValueTable();
  }

  Future<bool> checkExistingKey(String key) async {
    final db = await database;
    var res = await db.query("KeyValue WHERE key = '$key'");
    List<KeyValue> list =
        res.isNotEmpty ? res.map((c) => KeyValue.fromMap(c)).toList() : [];
    if (list.length > 0) {
      return true;
    } else
      return false;
  }

  Future<String> getValueByKey(String key) async {
    final db = await database;
    var res = await db.query("KeyValue WHERE key = '$key'");
    List<KeyValue> list =
        res.isNotEmpty ? res.map((c) => KeyValue.fromMap(c)).toList() : [];
    return list[0].value;
  }

  updateValueByKey(String key, String value) async {
    final db = await database;
    await db.execute("UPDATE KeyValue SET value = '$value' WHERE key = '$key'");
  }

  initialiseCaseScheduleTable() async {
    final db = await database;
    await db.execute("CREATE TABLE IF NOT EXISTS caseSchedule ("
        "id INT PRIMARY KEY,"
        "fk_client_case_id INT,"
        "date VARCHAR(255),"
        "status INT,"
        "min_user INT,"
        "notes TEXT,"
        "address VARCHAR(255),"
        "open_date VARCHAR(255),"
        "close_date VARCHAR(255),"
        "user_name VARCHAR(255),"
        "phone VARCHAR(255),"
        "schedule_date VARCHAR(255),"
        "name VARCHAR(255),"
        "fk_location_id INT,"
        "fk_schedule_id INT,"
        "fk_user_id VARCHAR(255),"
        "scheduleUserID INT,"
        "scheduleID INT,"
        "peers TEXT"
        ")");
  }

  addCaseSchedule(List<CaseSchedule> caseSchedules) async {
    final db = await database;
    await dropTable("caseSchedule");
    await initialiseCaseScheduleTable();
    for (var x in caseSchedules) {
      await db.execute(
          "INSERT INTO caseSchedule (fk_client_case_id, date, status, min_user, notes, address, open_date, close_date, user_name, phone, schedule_date, name, fk_location_id, fk_schedule_id, fk_user_id, scheduleUserID, scheduleID, peers) VALUES ('${x.fk_client_case_id}', '${x.date}', '${x.status}', '${x.min_user}', '${x.notes}', '${x.address}', '${x.open_date}', '${x.close_date}', '${x.user_name}', '${x.phone}', '${x.schedule_date}', '${x.name}', '${x.fk_location_id}', '${x.fk_schedule_id}', '${x.fk_user_id}' , '${x.scheduleUserID}' , '${x.scheduleID}' , '${x.peers}')");
    }
  }

  Future<List<CaseSchedule>> getCaseSchedule() async {
    final db = await database;
    var res = await db.query("caseSchedule");
    List<CaseSchedule> caseScheduleList = new List<CaseSchedule>();
    for (var x in res) {
      CaseSchedule newCaseSchedule = CaseSchedule().cast(x);
      caseScheduleList.add(newCaseSchedule);
    }
    return caseScheduleList;
  }

  updateCaseRequest(String caseID, int status) async {
    final db = await database;
    await db.execute(
        "UPDATE caseSchedule SET status = $status WHERE fk_client_case_id = $caseID");
  }

  removeSchedule(String caseID) async {
    final db = await database;
    await db.execute(
        "DELETE FROM caseSchedule WHERE fk_client_case_id = '$caseID'");
  }

  initialiseBeneficiaryTable() async {
    final db = await database;
    await db.execute("CREATE TABLE IF NOT EXISTS beneficiary ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "fk_case_id INT(11),"
        "first_name VARCHAR(255),"
        "last_name VARCHAR(255),"
        "nid VARCHAR(255),"
        "dob VARCHAR(255),"
        "ageing VARCHAR(255),"
        "address VARCHAR(255),"
        "marital_status VARCHAR(255),"
        "gender VARCHAR(255),"
        "skill VARCHAR(255),"
        "police_record VARCHAR(255),"
        "work_experience VARCHAR(255),"
        "responsible_party_name VARCHAR(255),"
        "responsible_party_relationship VARCHAR(255),"
        "qualification_level VARCHAR(255),"
        "qualification_year VARCHAR(255),"
        "school VARCHAR(255),"
        "university VARCHAR(255),"
        "working_capabilities VARCHAR(255),"
        "current_workplace VARCHAR(255),"
        "current_workplace_role VARCHAR(255),"
        "receives_pension VARCHAR(255),"
        "social_aid VARCHAR(255),"
        "home_phone VARCHAR(255),"
        "mobile_phone VARCHAR(255),"
        "work_experience_from_year int(11),"
        "work_experience_to_year int(11),"
        "number_of_children int(11),"
        "oprType int(11),"
        "FOREIGN KEY (fk_case_id) REFERENCES client_case(id)"
        ")");
  }

  Future<List<Beneficiary>> getBeneficiariesWithCaseID(String caseID) async {
    final db = await database;
    var res = await db.query("beneficiary WHERE fk_case_id = '$caseID'");
    print(res.length);
    List<Beneficiary> beneficiaryList = new List<Beneficiary>();
    for (var x in res) {
      Beneficiary newBeneficiary = Beneficiary().cast(x);
      beneficiaryList.add(newBeneficiary);
    }
    return beneficiaryList;
  }

  Future<List<Beneficiary>> getBeneficiaries() async {
    final db = await database;
    var res = await db.query(beneficiaryTable);
    List<Beneficiary> beneficiaryList = new List<Beneficiary>();
    for (var x in res) {
      Beneficiary newBeneficiary = Beneficiary().cast(x);
      beneficiaryList.add(newBeneficiary);
    }
    return beneficiaryList;
  }

  addFamilyMember(Beneficiary beneficiary) async {
    final db = await database;
    await removeIfExists(beneficiary);

    await db.execute(
        "INSERT INTO beneficiary (fk_case_id, first_name, last_name, ageing) VALUES ('${beneficiary.fk_case_id}', '${beneficiary.first_name}', '${beneficiary.last_name}', '${beneficiary.ageing}')");
  }

  addBeneficiaries(List<Beneficiary> beneficiaries) async {
    await dropTable(beneficiaryTable);
    await initialiseBeneficiaryTable();
    for (var x in beneficiaries) {
      addNewBeneficiary(x);
    }
  }

  addNewBeneficiary(Beneficiary beneficiary) async {
    final db = await database;
    await removeIfExists(beneficiary);
    var res = await db.rawInsert(
        "INSERT INTO beneficiary (fk_case_id, first_name, last_name, nid, dob, address, marital_status, gender, skill, police_record, work_experience, responsible_party_name, responsible_party_relationship, qualification_level, qualification_year, school, university, working_capabilities, current_workplace, current_workplace_role, receives_pension, social_aid, home_phone, mobile_phone, work_experience_from_year, work_experience_to_year, number_of_children, oprType)"
        "VALUES ('${beneficiary.fk_case_id}', '${beneficiary.first_name}', '${beneficiary.last_name}', '${beneficiary.nid}', '${beneficiary.dob}', '${beneficiary.address}', '${beneficiary.marital_status}', '${beneficiary.gender}', '${beneficiary.skill}', '${beneficiary.police_record}', '${beneficiary.work_experience}', '${beneficiary.responsible_party_name}', '${beneficiary.responsible_party_relationship}', '${beneficiary.qualification_level}', '${beneficiary.qualification_year}', '${beneficiary.school}', '${beneficiary.university}', '${beneficiary.working_capabilities}', '${beneficiary.current_workplace}', '${beneficiary.current_workplace_role}', '${beneficiary.receives_pension}', '${beneficiary.social_aid}', '${beneficiary.mobile_phone}', '${beneficiary.mobile_phone}', '${beneficiary.work_experience_from_year}', '${beneficiary.work_experience_to_year}', '${beneficiary.number_of_children}', '${beneficiary.oprType}')");
    return res;
  }

  removeIfExists(Beneficiary beneficiary) async {
    final db = await database;

    if (await checkExistingBeneficiary(beneficiary) == 1) {
      var res = await db.rawDelete(
          "DELETE FROM beneficiary WHERE first_name = '${beneficiary.first_name}' AND last_name = '${beneficiary.last_name}'");
    } else if (await checkExistingBeneficiary(beneficiary) == 2) {
      var result = await db.rawDelete(
          "DELETE FROM beneficiary WHERE first_name = '${beneficiary.last_name}' AND last_name = '${beneficiary.first_name}'");
    }
  }

  Future<int> checkExistingBeneficiary(Beneficiary beneficiary) async {
    final db = await database;
    var res = await db.query(
        "$beneficiaryTable WHERE first_name = '${beneficiary.first_name}' AND last_name = '${beneficiary.last_name}'");
    if (res.length > 0) return 1;

    var result = await db.query(
        "$beneficiaryTable WHERE first_name = '${beneficiary.last_name}' AND last_name = '${beneficiary.first_name}'");
    if (result.length > 0) return 2;

    return 0;
  }

  dropTable(String tableName) async {
    final db = await database;
    await db.execute("DROP TABLE $tableName");
  }
}
