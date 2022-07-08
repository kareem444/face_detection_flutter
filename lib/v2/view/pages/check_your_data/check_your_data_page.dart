import 'package:face_recongantion/v1/modules/studentorlecturer/lecturer_student.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/check_your_data_header_widget.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/check_your_data_profile_image_widget.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/info_widget/check_your_data_info_widget.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CheckYourDatapPage extends StatelessWidget {
  const CheckYourDatapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? usermodel = context.watch<AuthProvider>().newUserInfo;
    return CreatePageWidget(
      page: ListView(
        children: [
          if (usermodel != null) ...{
            const CheckYourDataHeaderWidget(),
            CheckYourDataProfileImageWidget(
              userModel: usermodel,
            ),
            const SpacerWidget(),
            CheckYourDataInfoWidget(
              userModel: usermodel,
            ),
            Column(children: [
              Column(
                children: [
                  const SpacerWidget(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: "Register Attendance",
                    buttonWidth: 1.4,
                    buttonColor: Colors.orange[400],
                    textColor: Colors.black54,
                    textSize: 22,
                    onPress: () => UserService.rgisterStudent(context),
                  ),
                  const SpacerWidget(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: "Cancel",
                    buttonWidth: 1.4,
                    textColor: Colors.black87,
                    transparent: true,
                    textSize: 22,
                    onPress: () => Get.offAll(ChooseBetween()),
                  ),
                  const SpacerWidget(),
                ],
              ),
            ]),
          } else ...{
            SizedBox(
              height: Get.height,
              child: const Center(
                child: Text(
                  "No Data",
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
