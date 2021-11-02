import 'package:flutter/material.dart';

class CusBtn extends StatelessWidget {
  const CusBtn(
      {Key? key,
      required this.width, this.height,
      required this.borderColor,
      required this.backgroundColor,
      required this.onTap,
      required this.insideWidget})
      : super(key: key);

  final double width;
  final double? height;
  final Color borderColor;
  final Color backgroundColor;
  final Widget insideWidget;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 40,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(38)),
        child: Center(child: insideWidget),
      ),
    );
  }
}
