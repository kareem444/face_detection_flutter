// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:face_recongantion/v2/controller/auth_provider.dart';
// import 'package:face_recongantion/v2/repo/session_repo.dart';
// import 'package:face_recongantion/v2/util/sudo/sudo_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/repo/session_repo.dart';
import 'package:face_recongantion/v2/util/sudo/sudo_users.dart';
import 'package:face_recongantion/v2/view/pages/lecture_location/widgets/view_all_student_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:face_recongantion/v2/controller/session_provider.dart';
import 'package:face_recongantion/v2/helper/excel_helper.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/view/pages/lecture_location/widgets/view_student_item_widget.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/divider_widget.dart';

class ViewStudentsWidget extends StatelessWidget {
  const ViewStudentsWidget({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.watch<SessionProvider>().viewCurrentSession.sessionName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Code :  " +
                    context
                        .watch<SessionProvider>()
                        .viewCurrentSession
                        .sessionCode,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const DividerWidget(),
        Expanded(child: Builder(builder: (context) {
          final users =
              context.watch<SessionProvider>().viewCurrentSession.users;
          return users == null || users.isEmpty
              ? const Center(
                  child: Text(
                    "No students yet.",
                    style: TextStyle(fontSize: 22),
                  ),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    UserModel userModel = UserModel.fromMap(users[index]);
                    return ViewStudentItemWidget(
                      userModel: userModel,
                      sessionId: sessionId,
                    );
                  },
                );
        })),
        const SpacerWidget(),
        Builder(builder: (context) {
          final users =
              context.watch<SessionProvider>().viewCurrentSession.users;
          return users == null || users.isEmpty
              ? Container()
              : const ViewAllStudentWidget();
        }),
        const DividerWidget(
          width: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(
                text: "Cancel",
                transparent: true,
                buttonBadding: 6,
                borderColor: Colors.black54,
                textColor: Colors.black54,
                textSize: 21,
                onPress: () async {
                  await SessionRepo.updateSession(
                    sessionId,
                    {
                      "users": FieldValue.arrayUnion([sudoUsers[0]])
                    },
                  );
                },
                // onPress: () => Get.back(),
              ),
              Builder(builder: (context) {
                final users =
                    context.watch<SessionProvider>().viewCurrentSession.users;
                return ButtonWidget(
                  text: "Done",
                  buttonBadding: 6,
                  textColor: Colors.black54,
                  buttonColor: Colors.orange[300],
                  textSize: 21,
                  onPress: () => ExcelHelper.createExcelSheet(users ?? []),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
