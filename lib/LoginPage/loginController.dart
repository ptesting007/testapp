import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/ApiService.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';
import 'package:testapp/AppCommon/SharedPreferences.dart';
import 'package:testapp/HomePage/HomeScreen.dart';

class LoginController extends GetxController {
  var isUserLogin = false.obs;
  final controller = ScrollController().obs;
  var offset = (0.0).obs;
  var isSelected = false.obs;
  var passwordInvisible = true.obs;
  var txtUserName = TextEditingController().obs;
  var txtPassword = TextEditingController().obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller(ScrollController());
    controller.value.addListener(onScroll);
    // offset(0.0);
    // isSelected(false);
    // passwordInvisible(true);
  }

  void onScroll() {
    offset(controller.value.hasClients ? controller.value.offset : 0);
  }

  void radio() {
    isSelected(!isSelected.value);
    update();
  }

  void passwordHideShow() {
    passwordInvisible(!passwordInvisible.value);
    update();
  }

  callAPILoginUser(Map<String, dynamic> param) {
    isLoading(true);

    ApiService.post(API_LOGIN, param: param, success: (data) {
      isLoading(false);
      SharedPrefs.setCustomObject(LOGINDATA, data);
      SharedPrefs.setBool(ISAUTOLOGIN, true);
      txtUserName.value.text = "";
      txtPassword.value.text = "";
      Get.offAll(() => HomePage());
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

  /*
  Declare API Response variable and Access that data on Home_Screen.
   */

}
