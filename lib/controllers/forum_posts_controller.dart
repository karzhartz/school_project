import "package:get/get.dart";
import 'package:school_ui/models/poster_model.dart';
import '../models/forum_post_model.dart';
import "../utils/assets.dart" as assets;

class ForumPostsController extends GetxController {
  RxList<ForumPostModel> _forumPosts = <ForumPostModel>[].obs;

  List<ForumPostModel> get forumPosts => _forumPosts.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _forumPosts.addAll([
      ForumPostModel(
        id: 1,
        title: "What is the square root of 20",
        description:
            '''Because the creational patterns are closely related, we'll study allfive of them
          together to highlight their similarities and differences.We'll also use a common
          example—building a maze for a computergame—to illustrate their implementations.
          The maze and the game willvary slightly from pattern to pattern. Sometimes the
          game will besimply to find your way out of a maze; in that case the player
          willprobably only have a local view of the maze. Sometimes mazes containproblems
          to solve and dangers to overcome, and these games may providea map of the part
          of the maze that has been explored''',
        datePosted: "12th March,2022",
        poster: PosterModel(
          id: 1,
          name: "Karz",
          rank: "I",
          stars: 3,
          profile_img: assets.wolf1,
        ),
      ),
      ForumPostModel(
        id: 1,
        title: "What is the square root of 20",
        description:
            "Because the creational patterns are closely related, we'll study allfive of them together to highlight their similarities and differences.",
        datePosted: "12th March,2022",
        poster: PosterModel(
          id: 2,
          name: "Maxim",
          rank: "I",
          stars: 5,
          profile_img: assets.wolf1,
        ),
      )
    ]);

    print(
        '''Because the creational patterns are closely related, we'll study allfive of them together to highlight their similarities and differences.'''
            .length);
  }
}
