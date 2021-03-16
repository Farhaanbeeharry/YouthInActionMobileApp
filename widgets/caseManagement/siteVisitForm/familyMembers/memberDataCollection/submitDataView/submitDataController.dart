import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/memberDataCollectionController.dart';

class SubmitFormController extends Controller {
  bool agreement = false;

  buttonClick() {
    StateMonitor.safelyGetControllerInstance<MemberDataCollectionController>(
        InstanceNames.MemberDataCollection, (memberDataCollection) {
      if (agreement)
        memberDataCollection.submit();
      else
        CustomSnackBar.showMessage(
            "error", "You have to agree to the terms and conditions", context);
    });
  }
}
