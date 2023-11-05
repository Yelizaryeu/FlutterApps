import 'package:core_ui/core_ui.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:flutter/material.dart';

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
      print('users not empty');
      if (users.isNotEmpty) {
        return ListView.separated(
          itemBuilder: (context, index) {
            int reverseIndex = users.length - index - 1;
            return UserTile(user: users[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1.0,
              indent: 4.0,
              endIndent: 4.0,
              color: AppColors.orange,
            );
          },
          itemCount: users.length,
        );
      } else {
        print('users empty');
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    } else {
      print('users is []');
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
