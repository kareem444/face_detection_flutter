import 'package:auto_size_text/auto_size_text.dart';
import 'package:face_recongantion/v2/util/constant_widgets.dart';
import 'package:face_recongantion/v2/view/pages/open_session/open_session_page.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterAttendenceFinishedPage extends StatelessWidget {
  const RegisterAttendenceFinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreatePageWidget(
      page: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SpacerWidget(),
            ConstantsWidget.logo(color: Colors.black54),
            const SpacerWidget(
              height: 40,
            ),
            Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green[700],
              size: Get.width * 0.5,
            ),
            const SpacerWidget(
              height: 30,
            ),
            const AutoSizeText(
              "You have been registered your attendance successfully",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SpacerWidget(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: AutoSizeText(
                "Press FINISH to return back to the opened sessions pade.",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            const SpacerWidget(
              height: 20,
            ),
            ButtonWidget(
              text: "Finish",
              buttonColor: Colors.orange[300],
              textColor: Colors.black54,
              textSize: 22,
              buttonWidth: 1.5,
              onPress: () => Get.off(() => const OpenSessionsPage()),
            ),
          ],
        ),
      ),
    );
  }
}
