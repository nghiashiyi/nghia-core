import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      color: AppColors.mediumGray
    );
  }
}
