import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:face_recongantion/v2/controller/session_provider.dart';
import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:face_recongantion/v2/service/session_service.dart';
import 'package:face_recongantion/v2/view/widgets/button_widget.dart';
import 'package:face_recongantion/v2/view/widgets/divider_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';

class EnterSessionCode extends StatelessWidget {
  const EnterSessionCode({
    Key? key,
    required this.sessionModel,
    required this.reload,
  }) : super(key: key);

  final SessionModel sessionModel;
  final Function() reload;

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();

    bool isWrongEnterSessionCode =
        context.watch<SessionProvider>().isWrongEnterSessionCode;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: context.watch<SessionProvider>().isLoadingSession
          ? []
          : [
              const SpacerWidget(),
              const Text(
                "Session Code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SpacerWidget(),
              const DividerWidget(),
              const SpacerWidget(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Session Code',
                      ),
                    ),
                    const SpacerWidget(),
                    if (isWrongEnterSessionCode)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "error code! please try again.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red[800],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SpacerWidget(),
              ButtonWidget(
                text: "Continue",
                textSize: 22,
                buttonWidth: 2,
                textColor: Colors.black54,
                buttonColor: Colors.orange[300],
                textBold: true,
                onPress: () {
                  SessionService.handelEnterSessionCode(
                      context, sessionModel, codeController.text, reload);
                },
              ),
              const SpacerWidget(
                height: 20,
              ),
            ],
    );
  }
}
