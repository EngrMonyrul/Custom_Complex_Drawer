import 'package:complex_drawer/models/drawer_item.dart';
import 'package:flutter/material.dart';

class ConstComponents {
  ConstComponents._();

  static final List<DrawerItem> drawerItems = [
    DrawerItem(
      icon: Icons.grid_view_rounded,
      title: "Dashboard",
      subMenu: [],
    ),
    DrawerItem(
      icon: Icons.subscriptions,
      title: "Category",
      subMenu: [
        "Videos",
        "Audios",
        "Images",
        "Icons",
      ],
    ),
    DrawerItem(
      icon: Icons.markunread_mailbox,
      title: "Posts",
      subMenu: [
        "Add",
        "Edit",
        "Delete",
      ],
    ),
    DrawerItem(
      icon: Icons.pie_chart,
      title: "Analysis",
      subMenu: [],
    ),
    DrawerItem(
      icon: Icons.trending_up,
      title: "Tending",
      subMenu: [],
    ),
    DrawerItem(
      icon: Icons.power,
      title: "Plugins",
      subMenu: [
        "Business Suit",
        "Instagram",
        "Twitter",
      ],
    ),
    DrawerItem(
      icon: Icons.explore,
      title: "Explore",
      subMenu: [],
    ),
    DrawerItem(
      icon: Icons.settings,
      title: "Settings",
      subMenu: [],
    ),
  ];
}
