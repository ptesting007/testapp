import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testapp/AppCommon/ApiService.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';
import 'package:testapp/AppCommon/SharedPreferences.dart';
import 'package:testapp/HomePage/HomeScreen.dart';
import 'package:testapp/Models/UserModel/UserModel.dart';

class UserProfileController extends GetxController {
  final controller = ScrollController().obs;
  UserModel user = Get.arguments[0];
  Map<String, dynamic> regParam = Map();
  var offset = (0.0).obs;
  var isSelected = false.obs;
  var passwordInvisible = true.obs;
  var confirmPasswordInvisible = true.obs;
  var isLoading = false.obs;

  var txtFirstName = TextEditingController().obs;
  var txtLastName = TextEditingController().obs;
  var txtEmailAddress = TextEditingController().obs;
  var txtReligion = TextEditingController().obs;
  var txtBirthDate = TextEditingController().obs;
  var txtGender = TextEditingController().obs;

  var focusFirstName = FocusNode().obs;
  var focusLastName = FocusNode().obs;
  var focusEmail = FocusNode().obs;
  var focusReligion = FocusNode().obs;
  var focusBirthDate = FocusNode().obs;
  var focusGender = FocusNode().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller(ScrollController());
    controller.value.addListener(onScroll);
    txtFirstName.value.text = user.firstName ?? "";
    txtLastName.value.text = user.lastName ?? "";
    txtEmailAddress.value.text = user.email ?? "";
    txtReligion.value.text = user.religion ?? "";
    txtBirthDate.value.text = user.birthDate ?? "";
    txtGender.value.text = user.gender ?? "";
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

  void confirmPasswordHideShow() {
    confirmPasswordInvisible(!confirmPasswordInvisible.value);
    update();
  }

  callAPIUpdateUser() {
    isLoading(true);
    ApiService.post(API_UPDATEPROFILE, param: regParam, success: (data) {
      isLoading(false);
      SharedPrefs.setCustomObject(LOGINDATA, data);
      SharedPrefs.setBool(ISAUTOLOGIN, true);
      Get.offAll(() => HomePage());
    }, failed: (data) {
      isLoading(false);
      showGetxBar(APP_NAME, data["message"]);
    }, error: (msg) {
      isLoading(false);
      showGetxBar(APP_NAME, msg.toString());
    });
  }


}
