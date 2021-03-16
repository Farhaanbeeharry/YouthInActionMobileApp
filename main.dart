import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yia/common/DBProvider.dart';
import 'package:yia/common/default.dart';
import 'package:yia/mainController.dart';
import 'package:yia/widgets/authentication/login/loginView.dart';
import 'package:yia/widgets/authentication/pinCode/pinCodeView.dart';
import 'package:yia/widgets/homePage/homePageView.dart';

void main() {
  runApp(DefaultViewStateless());
}

class DefaultViewStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AskForPermission(),
    );
  }
}

class DefaultViewStateful extends StatefulWidget {
  @override
  _DefaultViewStatefulState createState() => _DefaultViewStatefulState();
}

class _DefaultViewStatefulState extends State<DefaultViewStateful> {
  MainController mainController = MainController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainController.initialise(() {
      checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    DefaultService.mainContext = context;
    return Scaffold(
      body: initScreen(context),
    );
  }

  checkSession() async {
    await DefaultService.init();
    DefaultService.checkDefaultSettings();
    if (await DefaultService.checkSession()) {
      String rememberMe = await DBProvider.db.getValueByKey("RememberMe");

      if (rememberMe == "true") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PinCodeView(
              title: "Input Pin Code",
              previousPin: 0000,
              destination: HomePageView(),
              goToConfirm: false,
              checkDBPin: true,
              checkPrevious: false,
              changePassword: false,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      }
    } else {
      return; // to remove
      /*
      String password = PrefsService.prefs.getString('loginPassword');
      String email = PrefsService.prefs.getString('loginEmail');
      bool rememberMe = PrefsService.prefs.getBool('rememberMe');
      print(rememberMe);
      print(password);
      print(email);
      if (password != null && email != null && rememberMe) {
        APIService.post(getUrl('login'), {
          'requestType': 'login',
          'email': email,
          'password': password
        }).then((value) {
          if (value.success) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeView()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginView()));
          }
        });
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      }*/
    }
  }

  route() {}

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}

class AskForPermission extends StatefulWidget {
  @override
  _AskForPermissionState createState() => _AskForPermissionState();
}

class _AskForPermissionState extends State<AskForPermission> {
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    } else {
      SystemNavigator.pop();
    }
    return false;
  }

/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get gurrent location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DefaultViewStateful());
  }
}
