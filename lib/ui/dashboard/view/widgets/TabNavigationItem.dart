import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/HomeScreen.dart';

import '../AddProductScreen.dart';
import '../MyProfileScreen.dart';

class TabNavigationItem {
  final Widget? page;
  final Widget? title;
  final Icon? icon;

  TabNavigationItem({this.page, this.title, this.icon});

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const HomeScreen(),
      icon: const Icon(Icons.home),
      title: const Text("Home"),
    ),
    TabNavigationItem(
      page: AddProductScreen(),
      icon: const Icon(Icons.search),
      title: const Text("Search"),
    ),
    TabNavigationItem(
      page: const MyProfileScreen(),
      icon: const Icon(Icons.home),
      title: const Text("Home"),
    ),
  ];
}