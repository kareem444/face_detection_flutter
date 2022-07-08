import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:flutter/cupertino.dart';

class SessionRepo {
  static Future<String> addSession(
    Map<String, Object?> data,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("sessions")
          .add(data)
          .then((value) => value.id);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant add the session");
    }
  }

  static Future<List<SessionModel>> getSessions() async {
    try {
      var sessions = await FirebaseFirestore.instance
          .collection("sessions")
          .get()
          .then((value) => value.docs.map((e) {
                Map<String, dynamic> session = e.data();
                session.addAll({"sessionId": e.id});
                return SessionModel.fromMap(session);
              }).toList());
      return sessions;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant get the sessions");
    }
  }

  static Future<void> updateSession(
    String sessionId,
    Map<String, Object?> data,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("sessions")
          .doc(sessionId)
          .update(data);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant update the session");
    }
  }

  static Future<Stream<DocumentSnapshot<Map<String, dynamic>>>> streamOnSession(
      String sessionId) async {
    try {
      return FirebaseFirestore.instance
          .collection("sessions")
          .doc(sessionId)
          .snapshots();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant update the session");
    }
  }
}
