import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class FloatingAlertWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final int? textSize;
  final IconData? icon;
  final int? iconSize;
  final Color? iconColor;
  final int? spacerHeight;
  final int? spacerWidth;

  const FloatingAlertWidget({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.spacerHeight,
    this.spacerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.4),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width * .80,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: Get.width / (iconSize ?? 5),
                  color: iconColor ?? Colors.black45,
                ),
              SpacerWidget(
                height: Get.height / (spacerHeight ?? 40),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: Get.width / (textSize ?? 19),
                  color: textColor ?? Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
