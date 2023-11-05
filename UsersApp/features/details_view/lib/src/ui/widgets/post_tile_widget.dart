import 'package:core_ui/core_ui.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final PostModel post;

  const PostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkerGrey,
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.PADDING_12),
            child: Text(
              '"${post.title}"',
              style: AppFonts.normal14.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.PADDING_12),
            child: Text(
              '"${post.body}"',
              style: AppFonts.normal14.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
