import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  final double thickness;
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const ListDivider({
    required this.thickness,
    this.height,
    this.indent,
    this.endIndent,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      height: height ?? AppDimens.HEIGHT_1,
      indent: indent ?? AppDimens.INDENT_4,
      endIndent: endIndent ?? AppDimens.END_INDENT_4,
      color: color ?? AppColors.black,
    );
  }
}
