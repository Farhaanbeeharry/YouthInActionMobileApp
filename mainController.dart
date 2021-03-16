import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/variables.dart';

class MainController extends Controller {
  initialise(callback) async {
    await DBProvider.db.initialiseDB();
    // await DBProvider.db.checkTable("caseSchedule");
    await DBProvider.db.checkTable(DBProvider.beneficiaryTable);
    Common.emailAddress = await DBProvider.db.getValueByKey("EmailAddress");
    callback();
  }
}
