class NotificationModel {
  final int id;
  final String title;
  final String description;
  final String datePosted;
  final String thumbnail;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datePosted,
    required this.thumbnail,
  });
}

class ForumNotificationModel extends NotificationModel {
  final int forumPostId;
  ForumNotificationModel({
    required int id,
    required String title,
    required String description,
    required String datePosted,
    required String thumbnail,
    required this.forumPostId,
  }) : super(
          id: id,
          title: title,
          description: description,
          datePosted: datePosted,
          thumbnail: thumbnail,
        );
}

class AnnouncementModel extends NotificationModel {
  AnnouncementModel({
    required int id,
    required String title,
    required String description,
    required String datePosted,
    required String thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          datePosted: datePosted,
          thumbnail: thumbnail,
        );
}

extension EvaluateType on NotificationModel {
  bool get isForumNotification => this is ForumNotificationModel;
  bool get isAnnouncement => this is AnnouncementModel;
}
