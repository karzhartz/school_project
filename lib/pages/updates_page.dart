import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:school_ui/controllers/notification_controller.dart';
import 'package:school_ui/models/notification_model.dart';
import 'package:school_ui/widgets/announcement_widget.dart';
import 'package:school_ui/widgets/header_nav_widget.dart';
import 'package:school_ui/widgets/notification_widget.dart';

import '../utils/navigation.dart';
import "../utils/colors.dart" as appColors;

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class UpdatesPage extends StatefulHookWidget {
  const UpdatesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdatesPageState();
  }
}

class _UpdatesPageState extends State<UpdatesPage> {
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    final pages = [
      AnnouncementsPage(),
      NotificationsPage(),
    ];

    final selectedId = useState(0);

    pageController.addListener(() {
      selectedId.value = pageController.page!.round();
    });

    return Container(
      child: Column(
        children: [
          HeaderNavWidget(
            children: [
              Expanded(
                child: HeaderNavWidgetItem(
                  id: 0,
                  selectedId: selectedId,
                  title: "Announcements",
                  onTap: () {
                    pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Expanded(
                child: HeaderNavWidgetItem(
                  id: 1,
                  selectedId: selectedId,
                  title: "Notifications",
                  onTap: () {
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: PageView(
                physics: AlwaysScrollableScrollPhysics(),
                pageSnapping: true,
                controller: pageController,
                children: pages,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      NavigationSystem.getPageInfo("updates").runScheduledActions();
    });

    pageController = NavigationSystem.getPageInfo("updates").pageController
        as PageController;

    print("Initialized");
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    print("Activated");
  }
}

class AnnouncementsPage extends StatelessWidget {
  AnnouncementsPage({Key? key}) : super(key: key);
  final NotificationController _notificationController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Obx(() {
        return ListView.builder(
          itemCount: _notificationController.announcements.length,
          itemBuilder: (BuildContext context, int index) {
            AnnouncementModel announcementModel =
                _notificationController.announcements[index];

            return AnnouncementWidget(
              thumbnail_url: announcementModel.thumbnail,
              title: announcementModel.title,
              description: announcementModel.description,
            );
          },
        );
      }),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  final NotificationController _notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Obx(() {
        return ListView.builder(
          itemCount: _notificationController.notifications.length,
          itemBuilder: (BuildContext context, int index) {
            NotificationModel notificationModel =
                _notificationController.notifications[index];

            return NotificationWidget(
              thumbnail_url: notificationModel.thumbnail,
              title: notificationModel.title,
              descriptioon: notificationModel.description,
              onTap: () {
                if (notificationModel.isForumNotification) {
                  NavigationSystem.navigate("forum");
                }
              },
            );
          },
        );
      }),
    );
  }
}
