import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class NavigationError implements Exception {
  String message;
  NavigationError(this.message);

  String error() {
    print(message);
    return message;
  }
}

class NavigationPage {
  final String name;
  final Widget page;

  NavigationPage({required this.name, required this.page});
}

class NavigationPageInfo {
  final int index;
  final PageController pageController;

  /// List containing scheduled actions to be run when athe page is initialized
  List<Function()> _scheduledActions = [];

  NavigationPageInfo({required this.index, required this.pageController});

  /// adds an action to schedule
  void addAction(Function() action) {
    _scheduledActions.add(action);
  }

  /// Runs the schedu;ed actions and clears the schedule list after running
  /// all actions
  void runScheduledActions() {
    if (_scheduledActions.length > 0) {
      for (Function() action in _scheduledActions) {
        action();
      }
      clearScheduledActions();
    }
  }

  /// clears all actions from schedule
  void clearScheduledActions() {
    _scheduledActions.clear();
  }
}

class NavigationSystem {
  static TabController? tabController;
  static List<Widget> pages = [];
  static Map<String, NavigationPageInfo> pageRefsIds = {};
  static RxInt currentBottomNavPageIndex = 0.obs;

  /// adds list of pages of the NavigationPage class to tabController
  static addPages(List<NavigationPage> pgs) {
    for (int i = 0; i < pgs.length; i++) {
      pages.add(pgs[i].page);
      pageRefsIds[pgs[i].name] =
          NavigationPageInfo(index: i, pageController: PageController());
    }
    print("Added Pages");
    print(pages);
  }

  ///Navigates to named page
  static navigate(String name) {
    if (tabController == null)
      throw NavigationError("TabController not initialized");
    if (pages.length <= 0) throw NavigationError("Pages not initialized");
    if (pageRefsIds.containsKey(name) == false || pageRefsIds[name] == null) {
      throw NavigationError("Page Not Found.Check The Name");
    }
    tabController!.animateTo(pageRefsIds[name]!.index);
    currentBottomNavPageIndex.value = pageRefsIds[name]!.index;
  }

  ///navigates to corresponding page using page's index
  static navigateByIndex(int index) {
    switch (index) {
      case 0:
        NavigationSystem.navigate("updates");
        break;
      case 1:
        NavigationSystem.navigate("forum");
        break;
      default:
        NavigationSystem.navigate("updates");
    }
    currentBottomNavPageIndex.value = index;
  }

  ///Gets the NavigationPageInfo of the name page
  static NavigationPageInfo getPageInfo(String name) {
    if (pageRefsIds.containsKey(name) == false || pageRefsIds[name] == null) {
      throw NavigationError("Page Not Found.Check The Name");
    }
    return pageRefsIds[name] as NavigationPageInfo;
  }
}
