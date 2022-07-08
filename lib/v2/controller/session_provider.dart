import 'package:face_recongantion/v2/models/session_model.dart';
import 'package:flutter/foundation.dart';

class SessionProvider with ChangeNotifier {
  String? sessionType;
  String? sessionName;
  String? sessionCode;

  List<SessionModel> sessions = [];

  late SessionModel viewCurrentSession;

  bool isWrongEnterSessionCode = false;

  bool isLoadingSession = false;

  void setSessionType(String sessionType) {
    this.sessionType = sessionType;
    notifyListeners();
  }

  void setSessionName(String sessionName) {
    this.sessionName = sessionName;
    notifyListeners();
  }

  void setSessionCode(String sessionCode) {
    this.sessionCode = sessionCode;
    notifyListeners();
  }

  void setSessions(List<SessionModel> sessions) {
    this.sessions = sessions;
    notifyListeners();
  }

  void setViewCurrentSession(SessionModel viewCurrentSession) {
    this.viewCurrentSession = viewCurrentSession;
    notifyListeners();
  }

  void setIsWrongEnterSessionCode(bool isWrongEnterSessionCode) {
    this.isWrongEnterSessionCode = isWrongEnterSessionCode;
    notifyListeners();
  }

  void setIsLoadingSession(bool isLoadingSession) {
    this.isLoadingSession = isLoadingSession;
    notifyListeners();
  }
}
