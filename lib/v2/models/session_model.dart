class SessionModel {
  String sessionId;
  String sessionName;
  String sessionCode;
  String sessionType;
  String doctorName;
  List? users;

  SessionModel({
    required this.sessionId,
    required this.sessionName,
    required this.sessionCode,
    required this.sessionType,
    required this.doctorName,
    this.users,
  });

  Map<String, dynamic> toMap() {
    return {
      "sessionId": sessionId,
      'sessionName': sessionName,
      'sessionCode': sessionCode,
      'sessionType': sessionType,
      'doctorName': doctorName,
      'users': users?.toList(),
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      sessionId: map['sessionId'] ?? '',
      sessionName: map['sessionName'] ?? '',
      sessionCode: map['sessionCode'] ?? '',
      sessionType: map['sessionType'] ?? '',
      doctorName: map['doctorName'] ?? '',
      users: map['users'],
    );
  }
}
