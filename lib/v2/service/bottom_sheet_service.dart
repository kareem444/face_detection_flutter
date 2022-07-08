import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:face_recongantion/v2/view/pages/lecture_location/widgets/view_students_widget.dart';
import 'package:face_recongantion/v2/view/pages/open_session/widgets/enter_session_code.dart';
import 'package:flutter/material.dart';

class BottomSheetService {
  static viewStudents(BuildContext context, String sessionId) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      builder: (context) {
        return ViewStudentsWidget(
          sessionId: sessionId,
        );
      },
    );
  }

  static enterSessionCode(
      BuildContext context, SessionModel sessionModel, Function() reload) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EnterSessionCode(
            sessionModel: sessionModel,
            reload: reload,
          ),
        );
      },
    );
  }
}
