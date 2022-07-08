import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v1/modules/instructions/instructions_screen.dart';
import 'package:face_recongantion/v1/modules/registerstudent/register_student.dart';
import 'package:face_recongantion/v1/modules/studentorlecturer/lecturer_student.dart';
import 'package:face_recongantion/v2/controller/loading_widget_provider.dart';
import 'package:face_recongantion/v2/helper/feedback_widgets_helper.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/repo/file_repo.dart';
import 'package:face_recongantion/v2/repo/user_repo.dart';
import 'package:face_recongantion/v2/service/location_service.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/check_your_data_page.dart';
import 'package:face_recongantion/v2/view/pages/open_session/open_session_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class UserService {
  static holdUserInfo(BuildContext context, UserModel userModel) async {
    LocationData locationData = await LocationService.getCurrentLocation();
    context.read<LoadingWidgetProvidre>().handelLoadingScreen(true);
    userModel.latitude = locationData.latitude;
    userModel.longitude = locationData.longitude;
    context.read<AuthProvider>().handleNewUserInfo(userModel);
    context.read<LoadingWidgetProvidre>().handelLoadingScreen(false);
    Get.to(() => const Instructions());
  }

  static handleImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 3628,
        maxWidth: 2041,
        imageQuality: 80,
      );
      if (photo != null) {
        context.read<AuthProvider>().handleImagePath(photo.path);
        context.read<AuthProvider>().handleNewUserImageInfo(photo.path);
        Get.to(() => const CheckYourDatapPage());
      } else {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "No photo selected",
          color: Colors.red,
        );
      }
    } on PlatformException catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.message.toString(),
      );
    }
  }

  static rgisterStudent(BuildContext context) async {
    UserModel? userModel = context.read<AuthProvider>().newUserInfo;
    if (userModel != null) {
      context.read<LoadingWidgetProvidre>().handelLoadingScreen(true);
      try {
        userModel.id = DateTime.now().toString();
        final response = await addUserToFaceDetectionServer(context, userModel);

        if (response != null && response == true) {
          try {
            final UserCredential user =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: userModel.email!,
              password: userModel.code!,
            );
            String? imagePath = await uplodaImage(context, userModel.image!);

            userModel.image = imagePath;
            userModel.id = user.user!.uid;

            await addUserToFireBase(context, userModel);

            context.read<LoadingWidgetProvidre>().handelLoadingScreen(false);

            Get.offAll(() => const OpenSessionsPage());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              FeedBackWidgetsHelper.snakeBar(
                context: context,
                text: "The password provided is too weak.",
                color: Colors.red[700],
              );
            } else if (e.code == 'email-already-in-use') {
              FeedBackWidgetsHelper.snakeBar(
                context: context,
                text: "The account already exists for that email.",
                color: Colors.red[700],
              );
            }
            Get.offAll(() => const RigisterStudent());
          }
        }
        context.read<LoadingWidgetProvidre>().handelLoadingScreen(false);
      } catch (e) {
        context.read<LoadingWidgetProvidre>().handelLoadingScreen(false);
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: e.toString(),
          color: Colors.red[700],
        );
      }
    } else {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "No user info",
        color: Colors.red,
      );
      Get.offAll(() => const RigisterStudent());
    }
  }

  static Future<bool?> addUserToFaceDetectionServer(
    BuildContext context,
    UserModel userModel,
  ) async {
    try {
      final response = await UserRepo.addUserToFaceDetectionServer(userModel);
      if (response["sucess"] != null) {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: response["sucess"].toString(),
          color: Colors.green[700],
        );
        return true;
      } else if (response["error"] != null) {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: response["error"].toString(),
          color: Colors.red[700],
        );
      }
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
        color: Colors.red[700],
      );
    }
    return null;
  }

  static Future<String?> uplodaImage(
    BuildContext context,
    String imagePath,
  ) async {
    try {
      return await FileRepo.uploadFile(context, imagePath, null);
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "Error uploading image",
      );
      return "";
    }
  }

  static addUserToFireBase(BuildContext context, UserModel userModel) async {
    try {
      await UserRepo.addUserToFireBase(userModel);
      context.read<AuthProvider>().handelCurrentUser(userModel);
    } catch (e) {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.toString(),
      );
    }
  }

  static Future<bool?> checkIfUserExistOnServer(
    BuildContext context,
  ) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 3628,
      maxWidth: 2041,
      imageQuality: 80,
    );
    if (photo != null) {
      final response = await UserRepo.checkIfUserExistOnServer(photo.path);
      if (response["error"] != null) {
        return false;
      } else if (response["results"] != null) {
        if (response["results"] != "not-found") {
          return true;
        } else {
          return false;
        }
      }
    }
    return null;
  }

  static getCurrentuser(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> students =
            await UserRepo.getUser(user.uid, "students");
        if (students.exists) {
          UserModel userModel = UserModel.fromMap(students.data()!);
          context.read<AuthProvider>().handelCurrentUser(userModel);
        } else {
          DocumentSnapshot<Map<String, dynamic>> doctors =
              await UserRepo.getUser(user.uid, "doctors");
          if (doctors.exists) {
            UserModel userModel = UserModel.fromMap(doctors.data()!);
            context.read<AuthProvider>().handelCurrentUser(userModel);
          }
        }
      } catch (e) {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: e.toString(),
          color: Colors.red,
        );
      }
    } else {
      Get.offAll(ChooseBetween());
    }
  }

  static updateLocation(BuildContext context) async {
    LocationData locationData = await LocationService.getCurrentLocation();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      UserRepo.updateUser(
        "students",
        UserModel(id: FirebaseAuth.instance.currentUser!.uid),
        {
          "latitude": locationData.latitude,
          "longitude": locationData.longitude
        },
      );
    } else {
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "please login to update location",
        color: Colors.red,
      );
    }
  }
}
