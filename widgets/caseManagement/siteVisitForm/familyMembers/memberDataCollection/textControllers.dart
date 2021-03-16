import 'package:flutter/material.dart';
import 'package:yia/common/beneficiaryModel.dart';

class TextControllers {
  static String caseID;

  static TextEditingController firstNameController =
      new TextEditingController();
  static TextEditingController lastNameController = new TextEditingController();
  static String gender = "male";
  static TextEditingController nationalIDController =
      new TextEditingController();
  static String dateOfBirth = "Pick Date of Birth";

  static TextEditingController homePhoneController =
      new TextEditingController();
  static TextEditingController mobilePhoneController =
      new TextEditingController();
  static TextEditingController residenceAddressController =
      new TextEditingController();
  static TextEditingController responsiblePartyNameController =
      new TextEditingController();
  static TextEditingController responsiblePartyRelationshipController =
      new TextEditingController();

  static TextEditingController qualificationLevelController =
      new TextEditingController();
  static TextEditingController qualificationYearController =
      new TextEditingController();
  static TextEditingController schoolController = new TextEditingController();
  static TextEditingController universityController =
      new TextEditingController();
  static TextEditingController skillController = new TextEditingController();

  static TextEditingController previousWorkController =
      new TextEditingController();
  static TextEditingController fromYearController = new TextEditingController();
  static TextEditingController toYearController = new TextEditingController();
  static TextEditingController workingCapabilitiesController =
      new TextEditingController();
  static TextEditingController currentWorkPlaceController =
      new TextEditingController();
  static TextEditingController roleAtCurrentWorkPlaceController =
      new TextEditingController();

  static TextEditingController maritalStatusController =
      new TextEditingController();
  static TextEditingController numberOfChildrenController =
      new TextEditingController();
  static bool criminalRecord = false;
  static bool receivesPension = false;
  static TextEditingController socialAidController =
      new TextEditingController();

  static List<TextEditingController> familySizeControllers =
      new List<TextEditingController>();
  static List<String> ageGroups = new List<String>();

  static clearTextControllers() {
    firstNameController.clear();
    lastNameController.clear();
    gender = "male";
    nationalIDController.clear();
    dateOfBirth = "Pick Date of Birth";

    homePhoneController.clear();
    mobilePhoneController.clear();
    residenceAddressController.clear();
    responsiblePartyNameController.clear();
    responsiblePartyRelationshipController.clear();

    qualificationLevelController.clear();
    qualificationYearController.clear();
    schoolController.clear();
    universityController.clear();
    skillController.clear();

    previousWorkController.clear();
    fromYearController.clear();
    toYearController.clear();
    workingCapabilitiesController.clear();
    currentWorkPlaceController.clear();
    roleAtCurrentWorkPlaceController.clear();

    maritalStatusController.clear();
    numberOfChildrenController.clear();
    criminalRecord = false;
    receivesPension = false;
    socialAidController.clear();
  }

  static loadTextControllers(Beneficiary beneficiary) {
    if (beneficiary.first_name != null)
      firstNameController.text = beneficiary.first_name;
    if (beneficiary.last_name != null)
      lastNameController.text = beneficiary.last_name;
    if (beneficiary.gender != null) gender = beneficiary.gender;
    if (beneficiary.nid != null) nationalIDController.text = beneficiary.nid;
    if (beneficiary.dob != null) dateOfBirth = beneficiary.dob;

    if (beneficiary.home_phone != null)
      homePhoneController.text = beneficiary.home_phone;
    if (beneficiary.mobile_phone != null)
      mobilePhoneController.text = beneficiary.mobile_phone;
    if (beneficiary.address != null)
      residenceAddressController.text = beneficiary.address;
    if (beneficiary.responsible_party_name != null)
      responsiblePartyNameController.text = beneficiary.responsible_party_name;
    if (beneficiary.responsible_party_relationship != null)
      responsiblePartyRelationshipController.text =
          beneficiary.responsible_party_relationship;

    if (beneficiary.qualification_level != null)
      qualificationLevelController.text = beneficiary.qualification_level;
    if (beneficiary.qualification_year != null)
      qualificationYearController.text = beneficiary.qualification_year;
    if (beneficiary.school != null) schoolController.text = beneficiary.school;
    if (beneficiary.university != null)
      universityController.text = beneficiary.university;
    if (beneficiary.skill != null) skillController.text = beneficiary.skill;

    if (beneficiary.work_experience != null)
      previousWorkController.text = beneficiary.work_experience;
    if (beneficiary.work_experience_from_year != null)
      fromYearController.text = beneficiary.work_experience_from_year;
    if (beneficiary.work_experience_to_year != null)
      toYearController.text = beneficiary.work_experience_to_year;

    if (beneficiary.working_capabilities != null)
      workingCapabilitiesController.text = beneficiary.working_capabilities;
    if (beneficiary.current_workplace != null)
      currentWorkPlaceController.text = beneficiary.current_workplace;
    if (beneficiary.current_workplace_role != null)
      roleAtCurrentWorkPlaceController.text =
          beneficiary.current_workplace_role;

    if (beneficiary.marital_status != null)
      maritalStatusController.text = beneficiary.marital_status;
    if (beneficiary.number_of_children != null)
      numberOfChildrenController.text = beneficiary.number_of_children;
    criminalRecord = beneficiary.police_record == "true";
    receivesPension = beneficiary.receives_pension == "true";
    if (beneficiary.social_aid != null)
      socialAidController.text = beneficiary.social_aid;
  }
}
