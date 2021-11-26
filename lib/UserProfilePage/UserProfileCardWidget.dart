import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testapp/AppCommon/AppColorConstants.dart';
import 'package:testapp/AppCommon/AppConstants.dart';

import 'UserProfileController.dart';



class UserProfileCard extends StatelessWidget {
  final regController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: appTransWhiteColor,
        borderRadius: BorderRadius.circular(8.0),

      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("User Details",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeNormal),
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("First Name *",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              controller: regController.txtFirstName.value,
              focusNode: regController.focusFirstName.value,
              decoration: InputDecoration(
                  hintText: "First Name *",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Last Name *",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              controller: regController.txtLastName.value,
              focusNode: regController.focusLastName.value,
              decoration: InputDecoration(
                  hintText: "Last Name *",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Email *",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              readOnly: true,
              controller: regController.txtEmailAddress.value,
              focusNode: regController.focusEmail.value,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Religion",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              controller: regController.txtReligion.value,
              focusNode: regController.focusReligion.value,
              decoration: InputDecoration(
                  hintText: "Religion",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Text("Birthdate *",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateFormat("yyyy-MM-dd").parse(regController.txtBirthDate.value.text),
                  firstDate: DateTime(1901), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now(),
                );
                if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  regController.txtBirthDate.value.text = formattedDate; //set output date to TextField value.
                }else{
                  print("Date is not selected");
                }
              },
              readOnly: true,
              controller: regController.txtBirthDate.value,
              decoration: InputDecoration(

                  hintText: "Birthdate",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Text("Gender *",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(textSizeMedium))),
            TextField(
              onTap: () async {
                showActionSheetWithOptions(context);
              },
              readOnly: true,
              controller: regController.txtGender.value,
              decoration: InputDecoration(
                  hintText: "Gender",
                  hintStyle: TextStyle(
                      color: appGreyColor, fontSize: textSizeSmall)),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
          ],
        ),
      ),
    );
  }

  void showActionSheetWithOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('SELECT GENDER'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('MALE'),
              onPressed: () {
                Navigator.pop(context);
                regController.txtGender.value.text = 'MALE';
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('FEMALE'),
              onPressed: () {
                Navigator.pop(context);
                regController.txtGender.value.text = 'FEMALE';
              },
            ),

          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          )),
    );
  }
}
