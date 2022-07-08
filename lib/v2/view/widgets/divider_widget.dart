import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const DividerWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.0,
      child: Center(
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: height ?? 1.0,
          width: Get.width / (width ?? 1),
          color: color ?? Colors.grey[400],
        ),
      ),
    );
  }
}
