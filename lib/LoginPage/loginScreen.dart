import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/AppColorConstants.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';
import 'package:testapp/RegistrationPage/registrationScreen.dart';

import 'loginCardWidget.dart';
import 'loginController.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());

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
              SingleChildScrollView(
                controller: loginController.controller.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    myHeader(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: LoginCard(),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          //Do required Validation and API Call
                          //Do required Validation and API Call
                          if (loginController.txtUserName.value.text.trim().length == 0) {
                            showGetxBar(APP_NAME, "Please enter username");
                            return;
                          }
                          else if (loginController.txtPassword.value.text.trim().length == 0) {
                            showGetxBar(APP_NAME, "Please enter password");
                            return;
                          }
                          Map<String, dynamic> param = {"username" : loginController.txtUserName.value.text.trim(),
                            "password" : loginController.txtPassword.value.text.trim()};
                          loginController.callAPILoginUser(param);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: textSizeLargeMedium),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                appButtonColor)),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("New User? "),
                        InkWell(
                          onTap: () {
                            Get.to(() => RegistrationPage());
                          },
                          child: Text("SIGNUP",
                              style: TextStyle(
                                color: appButtonColor,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              loginController.isLoading.value
                  ? Center(
                      child: SpinKitChasingDots(color: kPrimaryColor),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ));
  }
}
