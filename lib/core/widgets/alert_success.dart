import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogSuccess extends StatelessWidget {
  AlertDialogSuccess({
    Key? key,
    this.title,
    this.description,
  }) : super(key: key);
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                AppIcons.check_icon.widget(width: 120, height: 120),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: AppColors.black),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
