import 'package:face_recongantion/modules/camera_page/camera_screen.dart';
import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(10), bottom: Radius.circular(10)),
            child: Image.asset(
              "assets/images/image.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 90,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 100),
                      child: Text(
                        "Taking Images",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 100,
                      ),
                      child: Container(
                        height: 180,
                        width: 180,
                        child: Image.asset(
                          "assets/images/image5-removebg-preview.png",
                          // color: Color.fromARGB(255, 46, 108, 102),
                          colorBlendMode: BlendMode.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  "  We will store some images of you\n  to make it easy for you to register \n           your attendance faster.",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      wordSpacing: 1.2,
                      letterSpacing: 1.03),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  '    Please keep the phone in a \n horizontal position against the \n     face and keep your facial\n expression normal until the end.',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      wordSpacing: 1.0,
                      letterSpacing: 1.04),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Note: if the camera doesn’t open automatically \n               then try to cancel and try again.",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: Colors.yellow,
                      //borderRadius: BorderRadius.circular(50),
                      ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CameraPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFECC5F),
                      //minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF887F6D)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(50),
                      ),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Instructions()));
                    },
                    style: ElevatedButton.styleFrom(
                      //minimumSize: Size(200, 50),
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
