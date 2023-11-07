import 'package:domain/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:users_view/src/ui/widgets/user_tile_divider_widget.dart';

import 'user_tile_widget.dart';

class UserListWidget extends StatelessWidget {
  final List<UserModel> users;

  const UserListWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (users != []) {
      if (users.isNotEmpty) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return UserTile(user: users[index]);
          },
          separatorBuilder: (context, index) {
            return const UserTileDivider();
          },
          itemCount: users.length,
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
