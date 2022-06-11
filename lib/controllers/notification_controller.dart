import 'package:get/get.dart';
import 'package:school_ui/models/notification_model.dart';
import '../utils/assets.dart' as assets;

class NotificationController extends GetxController {
  RxList<NotificationModel> _notifications = <NotificationModel>[].obs;
  RxList<AnnouncementModel> _announcements = <AnnouncementModel>[].obs;

  List<NotificationModel> get notifications => _notifications.value;
  List<AnnouncementModel> get announcements => _announcements.value;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   _notifications.addAll([
  //     NotificationModel(
  //       id: 1,
  //       title: "Test Notification 1",
  //       description: "This is a test notification 1",
  //       datePosted: "1st June,2022",
  //       thumbnail: assets.wolf1,
  //     ),
  //     NotificationModel(
  //       id: 1,
  //       title: "Test Notification 2",
  //       description: "This is a test notification 2",
  //       datePosted: "1st May,2022",
  //       thumbnail: assets.wolf1,
  //     ),
  //     ForumNotificationModel(
  //       id: 1,
  //       title: "Test Forum Notification",
  //       description: "This is a test forum notification",
  //       datePosted: "1st March,2022",
  //       thumbnail: assets.wolf1,
  //       forumPostId: 1,
  //     )
  //   ]);

  //   _announcements.value.addAll([
  //     AnnouncementModel(
  //       id: 1,
  //       title: "Test Announcmeent 1",
  //       description:
  //           """This is especially useful when you’re trying to pick out something other than a neutral UI typeface. Picking a nice serif with some personality for example can be tough.
  //       """,
  //       datePosted: "1st May,2022",
  //       thumbnail: assets.gif1,
  //     ),
  //     AnnouncementModel(
  //       id: 2,
  //       title: "Test Announcmeent 2",
  //       description:
  //           """This is especially useful when you’re trying to pick out something other than a neutral UI typeface. Picking a nice serif with some personality for example can be tough.This is especially useful when you’re trying to pick out something other than a neutral UI typeface. Picking a nice serif with some personality for example can be tough.This is especially useful when you’re trying to pick out something other than a neutral UI typeface. Picking a nice serif with some personality for example can be tough.
  //       """,
  //       datePosted: "23rd May,2022",
  //       thumbnail: assets.wolf1,
  //     ),
  //   ]);
  // }
}
