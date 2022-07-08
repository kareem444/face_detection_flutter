import 'package:flutter/material.dart';

class LoadingWidgetProvidre with ChangeNotifier {
  bool showLoadingScreen = false;

  handelLoadingScreen(bool val) {
    showLoadingScreen = val;
    print("loading screen is true");
    notifyListeners();
  }
}
