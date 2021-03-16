import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:yia/common/ApiUrl.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/BaseReturnType.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/api.dart';
import 'package:yia/common/beneficiaryModel.dart';
import 'package:yia/common/caseScheduleModel.dart';
import 'package:yia/common/widgets/snackBar/customSnackBar.dart';
import 'package:yia/widgets/homePage/homePageController.dart';

class SyncController extends Controller {
  bool showSpinner = false;

  syncData() async {
    this.view.callSetState(() {
      showSpinner = true;
    });

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await pushData();
      await getCount();
      await pullData();
      CustomSnackBar.showMessage(
          "success", "Data synced successfully!", context);
      StateMonitor.safelyGetControllerInstance<HomePageController>(
          InstanceNames.HomePage, (homePageController) {
        homePageController.goToPage(1);
      });
    } else {
      try {
        CustomSnackBar.showMessage("warning",
            "Failed! Connect to the internet to sync data!", context);
      } on Exception catch (e, s) {}
    }

    this.view.callSetState(() {
      showSpinner = false;
    });
  }

  getCount() async {
    var data = {"start": 0, "end": 1000000, "sortCol": "id", "asc": true};

    BaseReturnType response =
        await ApiService.post(ApiUrl.GETMOBILECOUNT, data, context);

    int workedCases = response.data['worked'].length;
    int nextCases = response.data['next'].length;
    int currentCases = response.data['current'].length;

    await DBProvider.db.updateValueByKey("WorkedCases", workedCases.toString());
    await DBProvider.db.updateValueByKey("NextCases", nextCases.toString());
    await DBProvider.db
        .updateValueByKey("CurrentCases", currentCases.toString());
  }

  pushData() async {
    await pushCaseSchedule();
    await pushBeneficiaries();
  }

  pullData() async {
    await pullCaseSchedules();
    // await pullBeneficiaries();
  }

  pushCaseSchedule() async {
    List<CaseSchedule> cases = await DBProvider.db.getCaseSchedule();
  }

  pushBeneficiaries() async {
    List<Beneficiary> beneficiaries = await DBProvider.db.getBeneficiaries();

    var data = jsonEncode(beneficiaries);

    BaseReturnType response =
        await ApiService.post(ApiUrl.SETBENEFICIARY, {"data": data}, context);

    print(response);
  }

  pullCaseSchedules() async {
    var data = {"start": 0, "end": 1000000, "sortCol": "id", "asc": true};

    BaseReturnType response =
        await ApiService.post(ApiUrl.CASESCHEDULE, data, context);

    List<CaseSchedule> caseList = new List<CaseSchedule>();

    for (Map<String, dynamic> caseItem in response.data) {
      CaseSchedule newCase = CaseSchedule().cast(caseItem);
      caseList.add(newCase);
    }

    DBProvider.db.addCaseSchedule(caseList);
  }

  pullBeneficiaries() async {
    var data = {"start": 0, "end": 1000000, "sortCol": "id", "asc": true};

    BaseReturnType response =
        await ApiService.post(ApiUrl.GETBENEFICIARIES, data, context);

    List<Beneficiary> beneficiaryList = new List<Beneficiary>();

    for (Map<String, dynamic> beneficiaryItem in response.data) {
      Beneficiary beneficiary = Beneficiary().cast(beneficiaryItem);
      beneficiaryList.add(beneficiary);
    }

    DBProvider.db.addBeneficiaries(beneficiaryList);
  }
}
