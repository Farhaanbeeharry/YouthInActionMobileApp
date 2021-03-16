import 'package:flutter/cupertino.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/beneficiaryModel.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class SiteVisitFormController extends Controller {
  loadPreviousData() async {
    List<Beneficiary> beneficiaries =
        await DBProvider.db.getBeneficiariesWithCaseID(TextControllers.caseID);
    CommonSiteVisit.beneficiaries = beneficiaries;

    for (var x in beneficiaries) {
      TextControllers.familySizeControllers.add(
          new TextEditingController(text: x.first_name + " " + x.last_name));
      TextControllers.ageGroups.add(x.ageing);
    }
  }

  setCaseID(String caseID) async {
    // await loadPreviousData();
    TextControllers.caseID = caseID;
  }

  updateDB() async {
    for (int i = 0; i < CommonSiteVisit.beneficiaries.length; i++) {
      await DBProvider.db.addNewBeneficiary(CommonSiteVisit.beneficiaries[i]);
    }
    CommonSiteVisit.beneficiaries.clear();
  }
}
