import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:testapp/HomePage/HomeScreen.dart';
import 'package:testapp/LoginPage/loginScreen.dart';

import 'AppCommon/AppConstants.dart';
import 'AppCommon/SharedPreferences.dart';
import 'appCommon/AppColorConstants.dart';

void main() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPrefs instance.
  await SharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light),
        // primarySwatch: green,
        primaryColor: kPrimaryColor,
      ),
      home: SharedPrefs.getBool(ISAUTOLOGIN) ? HomePage() : LoginPage(),
    );
  }
}
