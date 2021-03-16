import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familySize/familySizeController.dart';

class AgeGroupCardController with Controller {
  List<String> ageGroups = [
    "Age",
    "Baby",
    "Child",
    "Teenager",
    "Adult",
    "Senior"
  ];
  String selectedItem = "Age";

  removeMember(int index) {
    StateMonitor.safelyGetControllerInstance<FamilySizeController>(
        InstanceNames.FamilySize, (familySizeController) {
          familySizeController.removeMember(index);
    });
  }
}
