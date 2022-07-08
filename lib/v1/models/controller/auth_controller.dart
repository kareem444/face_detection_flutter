import 'package:face_recongantion/v1/models/services/auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;

  AuthController({required this.auth, this.email = '', this.password = ''});

  void coptyWith({String? email, String? password}) {
    this.email= email ?? this.email;
    this.password= password ?? this.password;
  }
}
