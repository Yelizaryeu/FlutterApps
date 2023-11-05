import 'package:core_ui/core_ui.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'user_cache_image_widget.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(
          DetailsViewRoute(user: user),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBlack,
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
        ),
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 60,
            //   backgroundColor: AppColors.grey,
            //   child: ClipOval(
            //     child:
            //   ),
            // ),
            UserCacheImageWidget(
              width: 100,
              height: 100,
              imageUrl: user.avatar ?? '',
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(user.name,
                      style: AppFonts.bold22.copyWith(
                        color: AppColors.white,
                        letterSpacing: 3.0,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
