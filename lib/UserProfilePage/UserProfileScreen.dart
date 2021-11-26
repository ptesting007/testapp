import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/AppColorConstants.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';

import 'UserProfileCardWidget.dart';
import 'UserProfileController.dart';

class UserProfilePage extends StatelessWidget {
  final regController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(maxWidth: Get.size.width, maxHeight: Get.size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Obx(() => Scaffold(
      backgroundColor: appBackgroundColor,
      body: Stack(
        children: [
          myHeader(),
          SingleChildScrollView(
            controller: regController.controller.value,
            child: Padding(
              padding: const EdgeInsets.only(top: 260.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        UserProfileCard(),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //Do required Validation and API Call
                                if (regController.txtFirstName.value.text.trim().length == 0) {
                                  showGetxBar(APP_NAME, "Please enter first name");
                                  regController.focusFirstName.value.requestFocus();
                                  return;
                                }
                                else if (regController.txtLastName.value.text.trim().length == 0) {
                                  showGetxBar(APP_NAME, "Please enter last name");
                                  regController.focusLastName.value.requestFocus();
                                  return;
                                }
                                else if (regController.txtEmailAddress.value.text.trim().length == 0) {
                                  showGetxBar(APP_NAME, "Please enter email address");
                                  regController.focusEmail.value.requestFocus();
                                  return;
                                }
                                else if (!emailVaidation(regController.txtEmailAddress.value.text.trim())) {
                                  showGetxBar(APP_NAME, "Please enter valid email address");
                                  regController.focusEmail.value.requestFocus();
                                  return;
                                }
                                else if (regController.txtGender.value.text.trim().length == 0) {
                                  showGetxBar(APP_NAME, "Please select gender");
                                  return;
                                }

                                regController.regParam = {"email": regController.txtEmailAddress.value.text.trim(),
                                  "first_name": regController.txtFirstName.value.text.trim(),
                                  "last_name": regController.txtLastName.value.text.trim(),
                                  "birth_date": regController.txtBirthDate.value.text.trim(),
                                  "gender": regController.txtGender.value.text.trim(),
                                  "religion": regController.txtReligion.value.text.trim()
                                };

                                regController.callAPIUpdateUser();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "UPDATE",
                                  style: TextStyle(fontSize: textSizeLargeMedium),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      appButtonColor)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Back",
                                  style: TextStyle(fontSize: textSizeLargeMedium),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      appButtonColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => regController.isLoading.value
              ? Center(child: SpinKitCircle(color: kPrimaryColor),)
              : SizedBox.shrink(),
          ),
        ],
      ),
    ));
  }
}
