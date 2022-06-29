import 'package:face_recongantion/models/clip_path.dart';
import 'package:flutter/material.dart';

class ChooseBetween extends StatelessWidget {
  ChooseBetween({Key? key}) : super(key: key);
  double w2 = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
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
            Center(
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Text(
                      "Welcome to \n     Atendy",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontFamily: "Kaushan Script"),
                    ),
                  ),
                  SizedBox(height: 55),
                  Text(
                    "You are ...",
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "loginlecturer");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Column(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                CircleAvatar(
                                  radius: 56,
                                  backgroundImage:
                                      AssetImage("assets/images/techear.png"),
                                ),
                                Spacer(
                                  flex: 3,
                                ),
                                Text(
                                  "Lecturer",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(
                                  flex: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "loginscreen");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Column(children: [
                              Spacer(
                                flex: 2,
                              ),
                              CircleAvatar(
                                radius: 56,
                                backgroundImage:
                                    AssetImage("assets/images/student.png"),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                              Text(
                                "student",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
