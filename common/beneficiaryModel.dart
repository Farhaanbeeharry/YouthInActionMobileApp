import 'package:yia/common/BaseReturnType.dart';

class                                                                                                      Beneficiary extends ReturnModel {
  dynamic fk_case_id,
      id,
      first_name,
      last_name,
      ageing,
      gender,
      nid,
      dob,
      address,
      responsible_party_name,
      responsible_party_relationship,
      qualification_level,
      qualification_year,
      school,
      university,
      skill,
      work_experience,
      working_capabilities,
      current_workplace,
      current_workplace_role,
      marital_status,
      police_record,
      receives_pension,
      social_aid,
      home_phone,
      mobile_phone,
      work_experience_from_year,
      work_experience_to_year,
      number_of_children;
  int oprType;

  Beneficiary(
      {this.fk_case_id,
      this.id,
      this.first_name,
      this.last_name,
      this.ageing,
      this.gender,
      this.nid,
      this.dob,
      this.address,
      this.responsible_party_name,
      this.responsible_party_relationship,
      this.qualification_level,
      this.qualification_year,
      this.school,
      this.university,
      this.skill,
      this.work_experience,
      this.working_capabilities,
      this.current_workplace,
      this.current_workplace_role,
      this.marital_status,
      this.police_record,
      this.receives_pension,
      this.social_aid,
      this.home_phone,
      this.mobile_phone,
      this.work_experience_from_year,
      this.work_experience_to_year,
      this.number_of_children,
      this.oprType});

  @override
  ReturnModel cast(Map<String, dynamic> json) {
    this.oprType = json['oprType'];
    this.fk_case_id = json['fk_client_case_id'];
    this.id = json['id'];
    this.first_name = json['first_name'];
    this.last_name = json['last_name'];
    this.ageing = json['ageing'];
    this.gender = json['gender'];
    this.nid = json['nid'];
    this.dob = json['dob'];
    this.address = json['address'];
    this.responsible_party_name = json['responsible_party_name'];
    this.responsible_party_relationship =
        json['responsible_party_relationship'];
    this.qualification_level = json['qualification_level'];
    this.qualification_year = json['qualification_year'];
    this.school = json['school'];
    this.university = json['university'];
    this.skill = json['skill'];
    this.work_experience = json['work_experience'];
    this.working_capabilities = json['working_capabilities'];
    this.current_workplace = json['current_workplace'];
    this.current_workplace_role = json['current_workplace_role'];
    this.marital_status = json['marital_status'];
    this.police_record = json['police_record'];
    this.receives_pension = json['receives_pension'];
    this.social_aid = json['social_aid'];
    this.home_phone = json['home_phone'];
    this.mobile_phone = json['mobile_phone'];
    this.work_experience_from_year = json['work_experience_from_year'];
    this.work_experience_to_year = json['work_experience_to_year'];
    this.number_of_children = json['number_of_children'];
    return this;
  }

  Map<String, dynamic> toJson() => {
        'oprType': this.oprType,
        'fk_case_id': this.fk_case_id,
        'id': this.id,
        'first_name': this.first_name,
        'last_name': this.last_name,
        'ageing': this.ageing,
        'gender': this.gender,
        'nid': this.nid,
        'dob': this.dob,
        'address': this.address,
        'responsible_party_name': this.responsible_party_name,
        'responsible_party_relationship': this.responsible_party_relationship,
        'qualification_level': this.qualification_level,
        'qualification_year': this.qualification_year,
        'school': this.school,
        'university': this.university,
        'skill': this.skill,
        'work_experience': this.work_experience,
        'working_capabilities': this.working_capabilities,
        'current_workplace': this.current_workplace,
        'current_workplace_role': this.current_workplace_role,
        'marital_status': this.marital_status,
        'police_record': this.police_record,
        'receives_pension': this.receives_pension,
        'social_aid': this.social_aid,
        'home_phone': this.home_phone,
        'mobile_phone': this.mobile_phone,
        'work_experience_from_year': this.work_experience_from_year,
        'work_experience_to_year': this.work_experience_to_year,
        'number_of_children': this.number_of_children
      };

  printBeneficiaryData() {
    print("Case ID: " + this.fk_case_id.toString());
    print("Beneficiary ID: " + this.id.toString());
    print("First name: " + this.first_name.toString());
    print("Last Name: " + this.last_name.toString());
    print("Ageing : " + this.ageing.toString());
    print("Gender : " + this.gender.toString());
    print("National ID : " + this.nid.toString());
    print("Date of Birth : " + this.dob.toString());
    print("Residence : " + this.address.toString());
    print("Responsible party name : " + this.responsible_party_name.toString());
    print("Responsible party relationship : " +
        this.responsible_party_relationship.toString());
    print("Qualification level : " + this.qualification_level.toString());
    print("Qualification year : " + this.qualification_year.toString());
    print("School : " + this.school.toString());
    print("University : " + this.university.toString());
    print("Skills : " + this.skill.toString());
    print("Previous workplace : " + this.work_experience.toString());
    print("Working capabilities : " + this.working_capabilities.toString());
    print("Current workplace : " + this.current_workplace.toString());
    print("Current workplace role : " + this.current_workplace_role.toString());
    print("Marital status : " + this.marital_status.toString());
    print("Criminal record : " + this.police_record.toString());
    print("Receives pension : " + this.receives_pension.toString());
    print("Social aid : " + this.social_aid.toString());
    print("Home phone : " + this.home_phone.toString());
    print("Mobile phone : " + this.mobile_phone.toString());
    print("Worked from year : " + this.work_experience_from_year.toString());
    print("Worked to year : " + this.work_experience_to_year.toString());
    print("Number of children : " + this.number_of_children.toString());
    print("oprType : " + this.oprType.toString());
  }
}
