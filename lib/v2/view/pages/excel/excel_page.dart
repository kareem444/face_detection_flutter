import 'package:auto_size_text/auto_size_text.dart';
import 'package:face_recongantion/v2/helper/excel_helper.dart';
import 'package:face_recongantion/v2/util/constant_widgets.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExcelPage extends StatelessWidget {
  const ExcelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreatePageWidget(
      page: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SpacerWidget(),
            ConstantsWidget.logo(color: Colors.black54),
            const SpacerWidget(),
            Container(
              height: Get.width / 2,
              width: Get.width / 2,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Image.asset(
                "assets/images/sheet_logo.png",
              ),
            ),
            const SpacerWidget(
              height: 30,
            ),
            const AutoSizeText(
              "The Excel File Is Ready",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
              maxLines: 1,
            ),
            const SpacerWidget(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(5.7),
              child: AutoSizeText(
                "Everything is prepared and ready in an editable excel file, we look forward to seeing you again",
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
              text: "Send To Email",
              buttonColor: Colors.orange[300],
              textColor: Colors.black54,
              textSize: 22,
              buttonWidth: 1.5,
              onPress: () => ExcelHelper.createExcelSheet([]),
            ),
            const SpacerWidget(
              height: 20,
            ),
            ButtonWidget(
              text: "Cancel",
              textColor: Colors.black54,
              textSize: 22,
              buttonWidth: 1.5,
              transparent: true,
              onPress: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
