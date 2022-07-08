import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  final dynamic imagePath;
  final bool isFileimage;
  final double? size;

  const ProfileImageWidget({
    Key? key,
    required this.imagePath,
    required this.isFileimage,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: isFileimage
            ? Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                width: Get.width / (size ?? 3),
                height: Get.width / (size ?? 3),
              )
            : CachedNetworkImage(
                imageUrl: imagePath,
                width: Get.width / (size ?? 3),
                height: Get.width / (size ?? 3),
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset("assets/images/user.jpg"),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red[600],
                ),
              ),
      ),
    );
  }
}
