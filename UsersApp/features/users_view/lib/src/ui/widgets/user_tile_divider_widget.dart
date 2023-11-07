import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UserTileDivider extends StatelessWidget {
  const UserTileDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListDivider(
      height: 4.0,
      thickness: 1.0,
      indent: 4.0,
      endIndent: 4.0,
      color: AppColors.orange,
    );
  }
}
