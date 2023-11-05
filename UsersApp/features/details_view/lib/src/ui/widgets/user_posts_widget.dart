import 'package:core_ui/core_ui.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:flutter/material.dart';

import 'post_tile_widget.dart';

class UserPostsWidget extends StatelessWidget {
  final List<PostModel> posts;

  const UserPostsWidget({
    required this.posts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (posts != []) {
      if (posts.isNotEmpty) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: AppDimens.PADDING_5),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            int reverseIndex = posts.length - index - 1;

            return PostTile(
              post: posts[reverseIndex],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1.0,
              indent: 4.0,
              endIndent: 4.0,
              color: AppColors.orange,
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
