import 'package:flutter/foundation.dart';

class ConnectivityCheckerProvider with ChangeNotifier {
  bool disConnected = false;

  hendelDisConnected(bool val) {
    disConnected = val;
    notifyListeners();
  }
}
