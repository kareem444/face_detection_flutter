import 'package:flutter/material.dart';

import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/view/widgets/profile_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class CheckYourDataProfileImageWidget extends StatelessWidget {
  const CheckYourDataProfileImageWidget({
    Key? key,
    required this.userModel,
    required this.isFile,
  }) : super(key: key);

  final UserModel userModel;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacerWidget(
          height: 15,
        ),
        ProfileImageWidget(
          imagePath: userModel.image,
          isFileimage: isFile,
          size: 4,
        ),
        const SpacerWidget(
          height: 10,
        ),
        Text(
          userModel.name!,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
