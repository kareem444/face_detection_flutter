import 'package:auto_size_text/auto_size_text.dart';
import 'package:face_recongantion/v2/view/widgets/divider_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

class OpenedSessionsHeaderWidget extends StatelessWidget {
  const OpenedSessionsHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacerWidget(
          height: 10,
        ),
        const AutoSizeText(
          'Opened Sessions',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        const SpacerWidget(
          height: 15,
        ),
        AutoSizeText(
          'Search for your course session and click on it to register your attendace.',
          style: TextStyle(
            fontSize: 23,
            color: Colors.grey[400],
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        const SpacerWidget(
          height: 15,
        ),
        const DividerWidget(),
        const SpacerWidget(
          height: 10,
        ),
      ],
    );
  }
}
