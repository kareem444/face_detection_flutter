import 'package:face_recongantion/v1/modules/loginlecturer/login_lecturer.dart';
import 'package:face_recongantion/v1/modules/loginstudent/login_student.dart';
import 'package:face_recongantion/v1/modules/studentorlecturer/lecturer_student.dart';
import 'package:face_recongantion/v2/helper/check_location_enabled_helper.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/controller/connectivity_checker_provider.dart';
import 'package:face_recongantion/v2/controller/loading_widget_provider.dart';
import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:face_recongantion/v2/controller/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'v1/modules/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CheckLocationEnabledHelper.check();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingWidgetProvidre()),
        ChangeNotifierProvider(create: (_) => ConnectivityCheckerProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SessionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
