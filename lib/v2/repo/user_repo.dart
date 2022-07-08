import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/helper/http_helper.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserRepo {
  static registerStudent(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
      String userId, String collection) async {
    try {
      return await FirebaseFirestore.instance
          .collection(collection)
          .doc(userId)
          .get();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant get the user");
    }
  }

  static Future addUserToFaceDetectionServer(UserModel userModel) async {
    try {
      return await SessionHelper.post(
        url: "register",
        filePath: userModel.image!,
        data: {
          "student_id": userModel.id,
          "student_name": userModel.name,
          "student_email": userModel.email,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  static addUserToFireBase(UserModel userModel) async {
    try {
      FirebaseFirestore.instance
          .collection("students")
          .doc(userModel.id)
          .set(userModel.toMap());
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant add the user");
    }
  }

  static Future checkIfUserExistOnServer(String imagePath) async {
    try {
      return await SessionHelper.post(
        url: "check_if_exist",
        filePath: imagePath,
        data: null,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future updateUser(
    String collection,
    UserModel userModel,
    Map<String, Object?> data,
  ) async {
    try {
      FirebaseFirestore.instance
          .collection(collection)
          .doc(userModel.id)
          .update(data);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("cant update the user");
    }
  }
}
