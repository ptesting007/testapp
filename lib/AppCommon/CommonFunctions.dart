import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'AppColorConstants.dart';
import 'AppConstants.dart';


void showGetxBar(String title, String message) {
  Get.snackbar("", "",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black54,
      titleText: Center(
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appWhiteColor,
                  fontSize: textSizeLargeMedium))),
      messageText: Center(
          child: Text(
        message,
        style: TextStyle(color: appWhiteColor, fontSize: textSizeLargeMedium),
      )));
}

//DateTime related Functions
String getCurrentDateTimeInString(String format) {
  DateTime now = DateTime.now();
  return DateFormat(format).format(now);
}

String getDateTimeInString(String format, DateTime dateTime) {
  return DateFormat(format).format(dateTime);
}

String getDateTimeToStringFromTimeStamp(String format, int timeStamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return DateFormat(format).format(date);
}

DateTime getDateTimeFromString(String format, String dateTime) {
  return DateFormat(format).parse(dateTime);
}

DateTime getDateTimeFromTimeStamp(String format, int timeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
}
//End DateTime related Functions


//Email Validation
bool emailVaidation(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regexEmail = new RegExp(pattern);
  return !regexEmail.hasMatch(email) ? false : true;
}

Widget appBarBackGround() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            gradientShadeTop,
            gradientShadeBottom,
          ],
        )),
  );
}


class FooterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
Widget myFooter() {
  return ClipPath(
    clipper: FooterClipper(),
    child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: Get.size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              gradientShadeTop,
              gradientShadeBottom,
            ],
          ),
        )),
  );
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
Widget myHeader() {
  return ClipPath(
    clipper: HeaderClipper(),
    child: Container(
      padding: EdgeInsets.only(left: 40, top: 50, right: 20),
      height: 290,
      width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              gradientShadeTop,
              gradientShadeBottom,
            ],
          ),
        ),
    ),
  );
}
