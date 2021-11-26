import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapp/Models/HomeScreenModels/drawerItem.dart';

final itemsFirst = [
  DrawerItem(title: 'Home', icon: FontAwesomeIcons.home),
  DrawerItem(title: 'New Arrival', icon: Icons.access_time_filled),
  // DrawerItem(title: 'Manage Profile', icon: FontAwesomeIcons.userAlt),
  // DrawerItem(title: 'Manage Password', icon: FontAwesomeIcons.lock),
  DrawerItem(title: 'Revised Price', icon: FontAwesomeIcons.backward),
  DrawerItem(title: 'RecentSearch', icon: FontAwesomeIcons.search),
  DrawerItem(title: 'Calendar', icon: FontAwesomeIcons.calendarAlt),
  DrawerItem(title: 'Media', icon: FontAwesomeIcons.facebookF),
  DrawerItem(title: 'Contact Us', icon: FontAwesomeIcons.phone),
  DrawerItem(title: 'Logout', icon: FontAwesomeIcons.signOutAlt),
];
