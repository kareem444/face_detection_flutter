class UserModel {
  String? name;
  String? email;
  String? code;
  String? id;
  String? image;
  double? latitude;
  double? longitude;

  UserModel({
    this.name,
    this.email,
    this.code,
    this.id,
    this.image,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'code': code,
      'id': id,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      code: map['code'],
      id: map['id'],
      image: map['image'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }
}
