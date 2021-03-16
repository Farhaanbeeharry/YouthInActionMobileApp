import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:string_validator/string_validator.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/beneficiaryModel.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class MemberDataCollectionController with Controller {
  final formKey = GlobalKey<FormState>();
  BuildContext secondaryContext;
  CarouselController pageController = new CarouselController();
  Beneficiary beneficiary = new Beneficiary();
  int index;
  String ageGroup;

  checkControllers() {
    if (beneficiary.first_name == null ||
        !identical(
            beneficiary.first_name, TextControllers.firstNameController)) {
      beneficiary.first_name = TextControllers.firstNameController.text;
    }

    if (beneficiary.last_name == null ||
        !identical(beneficiary.last_name, TextControllers.lastNameController)) {
      beneficiary.last_name = TextControllers.lastNameController.text;
    }

    beneficiary.gender = TextControllers.gender;

    if (beneficiary.nid == null ||
        !identical(beneficiary.nid, TextControllers.nationalIDController)) {
      beneficiary.nid = TextControllers.nationalIDController.text;
    }

    if (beneficiary.dob == null ||
        !identical(beneficiary.dob, TextControllers.dateOfBirth)) {
      beneficiary.dob = TextControllers.dateOfBirth;
    }

    if (beneficiary.home_phone == null ||
        !identical(
            beneficiary.home_phone, TextControllers.homePhoneController)) {
      beneficiary.home_phone = TextControllers.homePhoneController.text;
    }

    if (beneficiary.mobile_phone == null ||
        !identical(
            beneficiary.mobile_phone, TextControllers.mobilePhoneController)) {
      beneficiary.mobile_phone = TextControllers.mobilePhoneController.text;
    }

    if (beneficiary.address == null ||
        !identical(
            beneficiary.address, TextControllers.residenceAddressController)) {
      beneficiary.address = TextControllers.residenceAddressController.text;
    }

    if (beneficiary.responsible_party_name == null ||
        !identical(beneficiary.responsible_party_name,
            TextControllers.responsiblePartyNameController)) {
      beneficiary.responsible_party_name =
          TextControllers.responsiblePartyNameController.text;
    }

    if (beneficiary.responsible_party_relationship == null ||
        !identical(beneficiary.responsible_party_relationship,
            TextControllers.responsiblePartyRelationshipController)) {
      beneficiary.responsible_party_relationship =
          TextControllers.responsiblePartyRelationshipController.text;
    }

    if (beneficiary.qualification_level == null ||
        !identical(beneficiary.qualification_level,
            TextControllers.qualificationLevelController)) {
      beneficiary.qualification_level =
          TextControllers.qualificationLevelController.text;
    }

    if (beneficiary.qualification_year == null ||
        !identical(beneficiary.qualification_year,
            TextControllers.qualificationYearController)) {
      beneficiary.qualification_year =
          TextControllers.qualificationYearController.text;
    }

    if (beneficiary.school == null ||
        !identical(beneficiary.school, TextControllers.schoolController)) {
      beneficiary.school = TextControllers.schoolController.text;
    }

    if (beneficiary.university == null ||
        !identical(
            beneficiary.university, TextControllers.universityController)) {
      beneficiary.university = TextControllers.universityController.text;
    }

    if (beneficiary.skill == null ||
        !identical(beneficiary.skill, TextControllers.skillController)) {
      beneficiary.skill = TextControllers.skillController.text;
    }

    if (beneficiary.work_experience == null ||
        !identical(beneficiary.work_experience,
            TextControllers.previousWorkController)) {
      beneficiary.work_experience = TextControllers.previousWorkController.text;
    }

    if (beneficiary.work_experience_from_year == null ||
        !identical(beneficiary.work_experience_from_year,
            TextControllers.fromYearController)) {
      beneficiary.work_experience_from_year =
          TextControllers.fromYearController.text;
    }

    if (beneficiary.work_experience_to_year == null ||
        !identical(beneficiary.work_experience_to_year,
            TextControllers.toYearController)) {
      beneficiary.work_experience_to_year =
          TextControllers.toYearController.text;
    }

    if (beneficiary.working_capabilities == null ||
        !identical(beneficiary.working_capabilities,
            TextControllers.workingCapabilitiesController)) {
      beneficiary.working_capabilities =
          TextControllers.workingCapabilitiesController.text;
    }

    if (beneficiary.current_workplace == null ||
        !identical(beneficiary.current_workplace,
            TextControllers.currentWorkPlaceController)) {
      beneficiary.current_workplace =
          TextControllers.currentWorkPlaceController.text;
    }

    if (beneficiary.current_workplace_role == null ||
        !identical(beneficiary.current_workplace_role,
            TextControllers.roleAtCurrentWorkPlaceController)) {
      beneficiary.current_workplace_role =
          TextControllers.roleAtCurrentWorkPlaceController.text;
    }

    if (beneficiary.marital_status == null ||
        !identical(beneficiary.marital_status,
            TextControllers.maritalStatusController)) {
      beneficiary.marital_status = TextControllers.maritalStatusController.text;
    }

    if (beneficiary.number_of_children == null ||
        !identical(beneficiary.number_of_children,
            TextControllers.numberOfChildrenController)) {
      beneficiary.number_of_children =
          TextControllers.numberOfChildrenController.text;
    }

    beneficiary.police_record = TextControllers.criminalRecord.toString();
    beneficiary.receives_pension = TextControllers.criminalRecord.toString();

    if (beneficiary.social_aid == null ||
        !identical(
            beneficiary.social_aid, TextControllers.socialAidController)) {
      beneficiary.social_aid = TextControllers.socialAidController.text;
    }
  }

  submit() async {
    if (validateData()) {
      addToModel(beneficiary);

      CustomSnackBar.showMessage(
          "success",
          "Data for ${beneficiary.first_name} saved successfully !",
          secondaryContext);
      new Timer(new Duration(seconds: 2), () => {Navigator.pop(context)});
    }
  }

  bool validateData() {
    if (beneficiary.first_name.isEmpty) {
      validationError("First name cannot be empty", 1);
      return false;
    } else if (!isAlpha(beneficiary.first_name)) {
      validationError("First name cannot contain number(s)", 1);
      return false;
    } else if (beneficiary.last_name.isEmpty) {
      validationError("Last name cannot be empty", 1);
      return false;
    } else if (!isAlpha(beneficiary.last_name)) {
      validationError("Last name cannot contain number(s)", 1);
      return false;
    } else if (beneficiary.nid.isEmpty) {
      validationError("National ID cannot be empty", 1);
      return false;
    } else if (beneficiary.nid.length != 14) {
      validationError("Invalid National ID length", 1);
      return false;
    } else if (beneficiary.nid[0] != beneficiary.last_name[0]) {
      validationError("Invalid National ID", 1);
      return false;
    } else if (!isNumeric(beneficiary.home_phone)) {
      validationError("Invalid home phone number", 2);
      return false;
    } else if (!isNumeric(beneficiary.mobile_phone)) {
      validationError("Invalid mobile phone number", 2);
      return false;
    } else if (beneficiary.qualification_level.isEmpty) {
      validationError("Qualification level cannot be empty", 3);
      return false;
    } else if (beneficiary.qualification_year.isEmpty) {
      validationError("Qualification year cannot be empty", 3);
      return false;
    } else if (beneficiary.skill.isEmpty) {
      validationError("Should have at least 1 skill", 3);
      return false;
    } else if (!isNumeric(beneficiary.work_experience_from_year) &&
        !beneficiary.work_experience_from_year.isEmpty) {
      validationError("From year should be numbers only", 4);
      return false;
    } else if (!isNumeric(beneficiary.work_experience_to_year) &&
        !beneficiary.work_experience_to_year.isEmpty) {
      validationError("To year should be numbers only", 4);
      return false;
    } else if (beneficiary.working_capabilities.isEmpty) {
      validationError("Working capabilities cannot be empty", 4);
      return false;
    } else if (beneficiary.marital_status.isEmpty) {
      validationError("Marital status cannot be empty", 5);
      return false;
    } else if (beneficiary.number_of_children.isEmpty) {
      validationError("Number of child(ren) cannot be empty", 5);
      return false;
    } else if (!isNumeric(beneficiary.number_of_children)) {
      validationError("Number of children should be numbers only", 5);
      return false;
    } else
      return true;
  }

  addToModel(Beneficiary beneficiary) {
    CommonSiteVisit.beneficiaries[index].fk_case_id = TextControllers.caseID;
    CommonSiteVisit.beneficiaries[index].id = "0";
    CommonSiteVisit.beneficiaries[index].first_name = beneficiary.first_name;
    CommonSiteVisit.beneficiaries[index].last_name = beneficiary.last_name;
    CommonSiteVisit.beneficiaries[index].ageing = ageGroup;
    CommonSiteVisit.beneficiaries[index].gender = beneficiary.gender;
    CommonSiteVisit.beneficiaries[index].nid = beneficiary.nid;
    CommonSiteVisit.beneficiaries[index].dob = beneficiary.dob;
    CommonSiteVisit.beneficiaries[index].address = beneficiary.address;
    CommonSiteVisit.beneficiaries[index].responsible_party_name =
        beneficiary.responsible_party_name;
    CommonSiteVisit.beneficiaries[index].responsible_party_relationship =
        beneficiary.responsible_party_relationship;
    CommonSiteVisit.beneficiaries[index].qualification_level =
        beneficiary.qualification_level;
    CommonSiteVisit.beneficiaries[index].qualification_year =
        beneficiary.qualification_year;
    CommonSiteVisit.beneficiaries[index].school = beneficiary.school;
    CommonSiteVisit.beneficiaries[index].university = beneficiary.university;
    CommonSiteVisit.beneficiaries[index].skill = beneficiary.skill;
    CommonSiteVisit.beneficiaries[index].work_experience =
        beneficiary.work_experience;
    CommonSiteVisit.beneficiaries[index].working_capabilities =
        beneficiary.working_capabilities;
    CommonSiteVisit.beneficiaries[index].current_workplace =
        beneficiary.current_workplace;
    CommonSiteVisit.beneficiaries[index].current_workplace_role =
        beneficiary.current_workplace_role;
    CommonSiteVisit.beneficiaries[index].marital_status =
        beneficiary.marital_status;
    CommonSiteVisit.beneficiaries[index].police_record =
        beneficiary.police_record;
    CommonSiteVisit.beneficiaries[index].receives_pension =
        beneficiary.receives_pension;
    CommonSiteVisit.beneficiaries[index].social_aid = beneficiary.social_aid;
    CommonSiteVisit.beneficiaries[index].home_phone = beneficiary.home_phone;
    CommonSiteVisit.beneficiaries[index].mobile_phone =
        beneficiary.mobile_phone;
    CommonSiteVisit.beneficiaries[index].work_experience_from_year =
        beneficiary.work_experience_from_year;
    CommonSiteVisit.beneficiaries[index].work_experience_to_year =
        beneficiary.work_experience_to_year;
    CommonSiteVisit.beneficiaries[index].number_of_children =
        beneficiary.number_of_children;
    CommonSiteVisit.beneficiaries[index].oprType = 4;
  }

  validationError(String errorMsg, int page) {
    scrollToPage(page);
    CustomSnackBar.showMessage("error", errorMsg, secondaryContext);
  }

  scrollToPage(int page) {
    page = page - 1;
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 1500), curve: Curves.easeOutExpo);
  }
}
