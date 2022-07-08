import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:face_recongantion/v2/helper/feedback_widgets_helper.dart';
import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/repo/session_repo.dart';
import 'package:face_recongantion/v2/service/location_service.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/controller/loading_widget_provider.dart';
import 'package:face_recongantion/v2/controller/session_provider.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:face_recongantion/v2/view/pages/lecture_location/lecture_location_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SessionService {
  static addSession(BuildContext context) async {
    try {
      String sessionId = await SessionRepo.addSession(
        {
          "sessionType": context.read<SessionProvider>().sessionType,
          "sessionName": context.read<SessionProvider>().sessionName,
          "sessionCode": context.read<SessionProvider>().sessionCode,
          "doctorName": context.read<AuthProvider>().currentUser!.name,
        },
      );
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "Success adding session",
        color: Colors.green,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LectureLocationPage(sessionId: sessionId)));
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red,
      );
    }
  }

  static getSessions(BuildContext context) async {
    try {
      List<SessionModel> sessions = await SessionRepo.getSessions();
      context.read<SessionProvider>().setSessions(sessions);
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red,
      );
    }
  }

  static addStudentToSession(BuildContext context, sessionId) async {
    try {
      await SessionRepo.updateSession(
        sessionId,
        {
          "users": FieldValue.arrayUnion(
              [context.read<AuthProvider>().currentUser!.toMap()])
        },
      );
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "Success joing session",
        color: Colors.green,
      );
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red,
      );
    }
  }

  static removeStudentFromSession(
    BuildContext context,
    String sessionId,
    UserModel userModel,
  ) async {
    try {
      context.read<LocationProvider>().removeOneMark(userModel.id!);
      await SessionRepo.updateSession(
        sessionId,
        {
          "users": FieldValue.arrayRemove([userModel.toMap()])
        },
      );
    } catch (e) {
      Get.back();
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red,
      );
    }
  }

  static streamOnSession(BuildContext context, String sessionId) async {
    try {
      Future<Stream<DocumentSnapshot<Map<String, dynamic>>>> sessions =
          SessionRepo.streamOnSession(sessionId);
      sessions.then((value) => value.listen((e) {
            SessionModel sessionModel = SessionModel.fromMap(e.data()!);
            context.read<SessionProvider>().setViewCurrentSession(sessionModel);
          }));
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red,
      );
    }
  }

  static addMarkForAllStudent(BuildContext context) async {
    SessionModel sessionModel =
        context.read<SessionProvider>().viewCurrentSession;
    if (sessionModel.users != null) {
      LocationService.addMarkForAllStudent(
        context,
        sessionModel.users!,
      );
    }
    context.read<LocationProvider>().handelIsMarkAllStudent(true);
    Get.back();
  }

  static handelEnterSessionCode(BuildContext context, SessionModel sessionModel,
      String code, Function() reload) async {
    if (sessionModel.sessionCode == code) {
      context.read<SessionProvider>().setIsWrongEnterSessionCode(false);
      context.read<SessionProvider>().setIsLoadingSession(true);
      context.read<LoadingWidgetProvidre>().handelLoadingScreen(true);
      final response = await UserService.checkIfUserExistOnServer(context);
      if (response != null && response) {
        await addStudentToSession(context, sessionModel.sessionId);
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "Success joing session",
          color: Colors.green[700],
        );
      } else {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "Fail to join session",
          color: Colors.red[700],
        );
      }
      reload();
      Get.back();
      context.read<LoadingWidgetProvidre>().handelLoadingScreen(false);
      context.read<SessionProvider>().setIsLoadingSession(false);
    } else {
      context.read<SessionProvider>().setIsWrongEnterSessionCode(true);
    }
  }
}
