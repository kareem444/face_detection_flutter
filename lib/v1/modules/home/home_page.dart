import 'package:face_recongantion/v1/modules/getstarted/get_started1.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserService.getCurrentuser(context);
      _navigatetohome();
    });
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => GetStartedOne()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2D7775),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Atendy",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFFFFFFFF),
                  fontFamily: "Kaushan Script"),
            ),
            SizedBox(height: 5),
            Text(
              "Fast Attendance",
              style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
