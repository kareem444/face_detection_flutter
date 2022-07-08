import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/service/bottom_sheet_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class SessionsItemsWidget extends StatelessWidget {
  const SessionsItemsWidget({
    Key? key,
    required this.sessions,
    required this.reload,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Object?>> sessions;
  final Function() reload;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        itemCount: sessions.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> data =
              sessions[index].data() as Map<String, dynamic>;

          data.addAll({"sessionId": sessions[index].id});

          SessionModel sessionModel = SessionModel.fromMap(data);

          bool inSession = sessionModel.users != null &&
              sessionModel.users!
                  .map((user) => user["id"])
                  .contains(context.read<AuthProvider>().currentUser!.id);

          return InkWell(
            onTap: () {
              if (!inSession) {
                BottomSheetService.enterSessionCode(
                  context,
                  sessionModel,
                  reload,
                );
              }
            },
            child: Card(
              color: inSession ? Colors.grey : Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/lecture.png",
                    height: 80,
                  ),
                  const SpacerWidget(
                    height: 5,
                  ),
                  AutoSizeText(
                    sessionModel.sessionName,
                    style: TextStyle(
                      fontSize: 20,
                      color: inSession ? Colors.white70 : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  const SpacerWidget(
                    height: 5,
                  ),
                  AutoSizeText(
                    'Dr/' + sessionModel.doctorName,
                    style: TextStyle(
                      fontSize: 15,
                      color: inSession ? Colors.white70 : Colors.black45,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
