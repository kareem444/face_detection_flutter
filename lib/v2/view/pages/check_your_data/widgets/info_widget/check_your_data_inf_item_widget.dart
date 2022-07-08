import 'package:flutter/material.dart';

import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class CheckYourDataInfoItemWidget extends StatelessWidget {
  const CheckYourDataInfoItemWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, color: Colors.black45),
        ),
        const SpacerWidget(
          height: 2,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ],
    );
  }
}
