import 'package:face_recongantion/modules/loginlecturer/login_lecturer.dart';
import 'package:face_recongantion/modules/loginstudent/login_student.dart';
import 'package:face_recongantion/modules/studentorlecturer/lecturer_student.dart';
import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';





Future<void> main()  async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "choosebetween": (context) {
          return ChooseBetween();
        },
        "loginscreen": (context) {
          return const LoginScreenStudent();
        },
        "loginlecturer": (context) {
          return const LoginLecturer();
        }
      },
      home: const HomePage(),
    );
  }
}
