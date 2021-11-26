import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/ApiService.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';
import 'package:testapp/AppCommon/SharedPreferences.dart';
import 'package:testapp/LoginPage/loginScreen.dart';
import 'package:testapp/Models/UserModel/UserModel.dart';
import 'package:testapp/UserProfilePage/UserProfileScreen.dart';


class HomeController extends GetxController {
  var isUserLogin = false.obs;
  var listOption = List.generate(0, (index) => Map(), growable: true).obs;
  var isLoading = false.obs;
  /*
  Declare API Response variable and Access that data on Home_Screen.
   */

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    listOption.add(
        {"icon": FontAwesomeIcons.user, "title": "PROFILE"});
    listOption
        .add({"icon": FontAwesomeIcons.users, "title": "LIST USERS"});
    listOption.add({"icon": Icons.logout_rounded, "title": "LOGOUT"});
  }

  callAPIUserProfile() {
    isLoading(true);
    ApiService.get(API_PROFILE, success: (data) {
      isLoading(false);
      UserModel user = UserModel.fromJson(data);
      Get.to(() => UserProfilePage(), arguments: [user]);
    }, failed: (data) {
      isLoading(false);
      showGetxBar(APP_NAME, data["message"]);
    }, error: (msg) {
      isLoading(false);
      showGetxBar(APP_NAME, msg.toString());
    }
    );
  }

  callAPILogOutUser() {
    isLoading(true);
    ApiService.post(API_LOGOUT, success: (data) {
      isLoading(false);
      SharedPrefs.clearAllData();
      Get.offAll(() => LoginPage());
      showGetxBar(APP_NAME, data["message"]);
    }, failed: (data) {
      isLoading(false);
      showGetxBar(APP_NAME, data["message"]);
    }, error: (msg) {
      isLoading(false);

      showGetxBar(APP_NAME, msg.toString());
    },
      addHeader: true,
    );
  }
}
