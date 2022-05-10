import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:school_ui/controllers/notification_controller.dart';
import 'package:school_ui/pages/forum_page.dart';
import 'package:school_ui/pages/updates_page.dart';
import 'package:school_ui/utils/navigation.dart';
import "./utils/colors.dart" as appColors;
import 'controllers/forum_posts_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  NavigationSystem.addPages([
    NavigationPage(name: "updates", page: UpdatesPage()),
    NavigationPage(name: "forum", page: ForumPage()),
    // NavigationPage(name: "repository", page: Repository()),
  ]);

  Get.put(NotificationController());
  Get.put(ForumPostsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainLayout(),
    );
  }
}

class MainLayout extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    // TODO: implement buil
    NavigationSystem.tabController =
        useTabController(initialLength: NavigationSystem.pages.length);
    return Scaffold(
      backgroundColor: HexColor(appColors.blue5),
      body: TabBarView(
        children: NavigationSystem.pages,
        controller: NavigationSystem.tabController,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            return IconThemeData(
              color: HexColor(appColors.blue3),
            );
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            return GoogleFonts.notoSans(
              color: HexColor(appColors.blue2),
              fontSize: 10.5,
            );
          }),
        ),
        child: Obx(() {
          return NavigationBar(
            backgroundColor: HexColor(appColors.blue6),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.notifications,
                ),
                label: "Updates",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.message,
                ),
                label: "Forum",
              ),
              NavigationDestination(
                icon: Icon(Icons.file_present),
                label: "Repository",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.download_for_offline_outlined,
                ),
                label: "Downloads",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings",
              ),
            ],
            selectedIndex: NavigationSystem.currentBottomNavPageIndex.value,
            onDestinationSelected: NavigationSystem.navigateByIndex,
          );
        }),
      ),
    );
  }
}
