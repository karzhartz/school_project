import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:school_ui/controllers/forum_posts_controller.dart';
import 'package:school_ui/models/forum_post_model.dart';
import 'package:school_ui/pages/repository.dart';
import 'package:school_ui/utils/navigation.dart';

import '../widgets/forum_post_widget.dart';

class ForumPage extends HookWidget {
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    pageController = NavigationSystem.getPageInfo("forum").pageController;
    return Container(
      child: PageView(
        controller: pageController,
        children: [
          ForumPostPage(),
        ],
      ),
    );
  }
}

class ForumPostPage extends StatelessWidget {
  ForumPostPage({Key? key}) : super(key: key);

  final ForumPostsController _forumPostsController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return ListView.builder(
        itemCount: _forumPostsController.forumPosts.length,
        itemBuilder: (BuildContext context, int index) {
          ForumPostModel forumPostModel =
              _forumPostsController.forumPosts[index];
          return ForumPostWidget(
            id: forumPostModel.id,
            posterProfileImgUrl: forumPostModel.poster.profile_img,
            posterName: forumPostModel.poster.name,
            description: forumPostModel.description,
            title: forumPostModel.title,
            stars: forumPostModel.poster.stars,
          );
        },
      );
    });
  }
}
