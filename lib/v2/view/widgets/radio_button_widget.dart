import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({
    Key? key,
    this.size,
    this.onTap,
    this.checked = false,
    this.color,
    this.circleColor,
  }) : super(key: key);

  final double? size;
  final Function()? onTap;
  final bool checked;
  final Color? color;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width / (size ?? 15),
        height: Get.width / (size ?? 15),
        decoration: BoxDecoration(
          border: Border.all(color: color ?? Colors.black54, width: 2),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: checked
              ? Container(
                  width: Get.width / (size != null ? size! + 15 : 30),
                  height: Get.width / (size != null ? size! + 15 : 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: circleColor ?? Colors.black45,
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
