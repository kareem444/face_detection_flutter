import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  UserModel? currentUser;

  String? imagePath;

  UserModel? newUserInfo;

  handelCurrentUser(UserModel val) {
    currentUser = val;
    notifyListeners();
  }

  handleImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }

  handleNewUserInfo(UserModel val) {
    newUserInfo = val;
    notifyListeners();
  }

  handleNewUserImageInfo(String path) {
    newUserInfo?.image = path;
    notifyListeners();
  }
}
