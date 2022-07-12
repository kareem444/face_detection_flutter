import 'package:face_recongantion/v2/service/session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:face_recongantion/v1/modules/studentorlecturer/lecturer_student.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/check_your_data_header_widget.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/check_your_data_profile_image_widget.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/info_widget/check_your_data_info_widget.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class CheckYourDatapPage extends StatelessWidget {
  const CheckYourDatapPage({
    Key? key,
    required this.isRegister,
    this.sessionModel,
  }) : super(key: key);

  final bool isRegister;
  final SessionModel? sessionModel;

  @override
  Widget build(BuildContext context) {
    UserModel? usermodel = isRegister
        ? context.watch<AuthProvider>().newUserInfo
        : context.watch<AuthProvider>().currentUser;
    return CreatePageWidget(
      page: ListView(
        children: [
          if (usermodel != null) ...{
            const CheckYourDataHeaderWidget(),
            CheckYourDataProfileImageWidget(
              userModel: usermodel,
              isFile: isRegister ? true : false,
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
                    text: isRegister ? "Continue" : "Register Attendance",
                    buttonWidth: 1.4,
                    buttonColor: Colors.orange[400],
                    textColor: Colors.black54,
                    textSize: 22,
                    onPress: () {
                      if (isRegister) {
                        UserService.rgisterStudent(context);
                      } else if (!isRegister && sessionModel != null) {
                        SessionService.addStudentToSession(
                            context, sessionModel?.sessionId);
                      }
                    },
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
                    onPress: () {
                      if (isRegister) {
                        Get.offAll(ChooseBetween());
                      } else {
                        Get.back();
                      }
                    },
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
