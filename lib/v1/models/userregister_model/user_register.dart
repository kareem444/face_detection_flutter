class SocialUserModel {
  String? name;
  String? email;
  String? codeUniversity;
  String? uId;


  String? createdate;

  SocialUserModel({
    this.name,
    this.email,
    this.codeUniversity,
    this.uId,
   this.createdate,
  });

  SocialUserModel.fromJson(Map<String, dynamic>? json) {
    this.name = json!['name'];

    this.email = json['email'];
    this.codeUniversity = json['code'];
    this.uId = json['id'];
    this.createdate=json['createdat'];


  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': codeUniversity,
      'id': uId,
      'createdat':createdate,

    };
  }
}
