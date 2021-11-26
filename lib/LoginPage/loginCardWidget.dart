import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/AppColorConstants.dart';
import 'package:testapp/AppCommon/AppConstants.dart';

import 'loginController.dart';

class LoginCard extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: cardBackGroundColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: cardShadowColor,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: cardShadowColor,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeNormal),
                    // fontFamily: fontPoppinsBold, // "Poppins-Bold",
                    fontWeight: FontWeight.bold,
                    letterSpacing: .6 )),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Username",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              controller: loginController.txtUserName.value,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle:
                      TextStyle(color: textFieldHintTextColor, fontSize: textSizeSmall)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Password",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            Obx(() => TextFormField(
                  controller: loginController.txtPassword.value,
                  obscureText: loginController.passwordInvisible.value,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginController.passwordInvisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          // color: Colors.black,
                        ),
                        onPressed: loginController.passwordHideShow,
                      ),
                      hintText: "**********",
                      hintStyle: TextStyle(
                          color: textFieldHintTextColor, fontSize: textSizeSmall)),
                )),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
          ],
        ),
      ),
    );
  }
}
