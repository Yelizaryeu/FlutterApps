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
      height: height ?? 1.0,
      indent: indent ?? 4.0,
      endIndent: endIndent ?? 4.0,
      color: color ?? AppColors.black,
    );
  }
}
