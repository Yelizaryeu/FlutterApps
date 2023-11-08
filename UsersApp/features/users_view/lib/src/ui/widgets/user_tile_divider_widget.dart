import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UserTileDivider extends StatelessWidget {
  const UserTileDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListDivider(
      height: AppDimens.HEIGHT_4,
      thickness: AppDimens.THICKNESS_1,
      indent: AppDimens.INDENT_4,
      endIndent: AppDimens.END_INDENT_4,
      color: AppColors.orange,
    );
  }
}
