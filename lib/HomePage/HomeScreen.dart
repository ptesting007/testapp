import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:testapp/AppCommon/AppColorConstants.dart';
import 'package:testapp/AppCommon/AppConstants.dart';
import 'package:testapp/AppCommon/CommonFunctions.dart';


import 'homeController.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: Text(
          "HOME",
          style: TextStyle(
              color: navTitleTextColor,
              fontWeight: FontWeight.bold,
              fontSize: textSizeMedium),
        ),
        flexibleSpace: appBarBackGround(),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              myHeader(),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 5),
                  itemCount: homeController.listOption.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                        onTap: () {
                          switch (index + 1) {
                            case 1:
                              homeController.callAPIUserProfile();
                              break;
                            case 2:
                              break;
                            case 3:
                              //Logout User
                              homeController.callAPILogOutUser();
                              break;
                          }
                        },
                        child: buildCardWithIcon(
                            homeController.listOption[index]["icon"],
                            homeController.listOption[index]["title"]));
                  }),
            ],
          ),
          myFooter()
        ],
      ),
    );
  }

  Padding buildCardWithIcon(IconData icon, String pageName) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                gradientShadeTop,
                gradientShadeBottom
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                icon,
                size: 35.0,
                color: Colors.white,
              ),
              /*Icon(
                icon,
                size: 70,
                color: Colors.blue,
              ),*/
              SizedBox(
                height: 10,
              ),
              Text(
                pageName,
                style: TextStyle(
                  fontSize: textSizeSMedium,
                  color: Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
