import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

class CheckYourDataHeaderWidget extends StatelessWidget {
  const CheckYourDataHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SpacerWidget(
          height: 15,
        ),
        Text(
          "Check Your data!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SpacerWidget(
          height: 10,
        ),
        Text(
          "If every thing is correct then press ‘Register Attendance’, if not press ‘Cancel’.",
          style: TextStyle(fontSize: 22, color: Colors.black38),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
