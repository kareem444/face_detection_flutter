import 'package:face_recongantion/v1/models/pincode.dart';
import 'package:face_recongantion/v1/modules/create_new_session/new_session.dart';
import 'package:face_recongantion/v1/shared/components/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifiactionPage extends StatefulWidget {
  const VerifiactionPage({Key? key}) : super(key: key);

  @override
  State<VerifiactionPage> createState() => _VerifiactionPageState();
}

class _VerifiactionPageState extends State<VerifiactionPage> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/woman-with-phone-doing-face-scan.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0A6C6F).withOpacity(0.5),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Verification",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "Check Your Email",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "Atendy has sent a code to verify the \n                 forgetten password ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[400],
                                  wordSpacing: 1.2),
                            ),
                            Spacer(
                              flex: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(width: 20,),
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 5,
                            ),
                            defualtButton(
                                text: "Verifiaction",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateNewSession(),
                                      ));
                                }),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "Resend : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black38),
                                )),
                                TweenAnimationBuilder(
                                    tween: Tween(
                                        begin: Duration(minutes: 1),
                                        end: Duration.zero),
                                    duration: Duration(minutes: 1),
                                    builder: (BuildContext context,
                                        Duration value, Widget? child) {
                                      final minutes = value.inMinutes;
                                      final seconds = value.inSeconds % 60;
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text('0$minutes:$seconds',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFECB44C),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25)));
                                    }),
                              ],
                            ),
                            Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
