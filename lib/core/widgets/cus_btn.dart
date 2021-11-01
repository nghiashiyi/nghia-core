import 'package:flutter/material.dart';

class CusBtn extends StatelessWidget {
  const CusBtn(
      {Key? key,
      required this.width,
      required this.boderColor,
      required this.backgroundColor,
      required this.onTap,
      required this.insideWidget})
      : super(key: key);

  final double width;
  final Color boderColor;
  final Color backgroundColor;
  final Widget insideWidget;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: boderColor),
            borderRadius: BorderRadius.circular(38)),
        child: Center(child: insideWidget),
      ),
    );
  }
}
