import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/commonSiteVisit.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class SubmitDataController extends Controller {
  submitData() async {
    for (var x in CommonSiteVisit.beneficiaries) {
      DBProvider.db.addNewBeneficiary(x);
    }
    await DBProvider.db.removeSchedule(TextControllers.caseID);
    TextControllers.caseID = "";
    CommonSiteVisit.beneficiaries.clear();
  }
}
