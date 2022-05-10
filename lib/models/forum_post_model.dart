import 'package:school_ui/models/poster_model.dart';

class ForumPostModel {
  final int id;
  final String title;
  final String description;
  final String datePosted;
  final PosterModel poster;

  ForumPostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datePosted,
    required this.poster,
  });

  factory ForumPostModel.createForumPost(Map forumPost) {
    return ForumPostModel(
      id: forumPost["id"],
      title: forumPost["title"],
      description: forumPost['description'],
      datePosted: forumPost["date_posted"],
      poster: PosterModel.createPoster(forumPost["poster"]),
    );
  }
}
