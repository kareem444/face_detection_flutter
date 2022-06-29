import 'package:face_recongantion/modules/forgertpassword/forgert_password.dart';
import 'package:face_recongantion/modules/registerlecturer/register_lecturer.dart';
import 'package:face_recongantion/shared/components/components/components.dart';
import 'package:flutter/material.dart';

class LoginLecturer extends StatefulWidget {
  const LoginLecturer({Key? key}) : super(key: key);

  @override
  State<LoginLecturer> createState() => _LoginLecturerState();
}

class _LoginLecturerState extends State<LoginLecturer> {
  bool _forgetPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/woman-with-phone-doing-face-scan.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Color.fromARGB(255, 10, 108, 111).withOpacity(0.5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
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
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Center(
                      child: Text(
                        "Atendy",
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w200,
                            color: Color(0xFFFFFFFF),
                            fontFamily: "Kaushan Script"),
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                         defualtText(text: "Email"),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 50,
                              child: Material(
                                elevation: 12,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(fontSize: 18),
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                    prefixIcon: Icon(Icons.email),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    // enabledBorder: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                           defualtText(text: "Password"),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 50,
                              child: Material(
                                elevation: 10,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontSize: 18),
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _forgetPassword
                                            ? Icons.visibility_off
                                            : Icons
                                                .visibility, //change icon based on boolean value
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _forgetPassword =
                                              !_forgetPassword; //change boolean value
                                        });
                                      },
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    // enabledBorder: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                  obscureText: _forgetPassword,
                                ),
                              ),
                            ),
                            defualtTextButton(textbutton: "Forget Password", function: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgertPassword()));
                            }),
                            Spacer(
                              flex: 2,
                            ),
                          defualtButton(text: "Login", function: (){

                          }),
                            Spacer(
                              flex: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Don't have account?",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )),
                               defualtTextButton(textbutton: "Register", function: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterLecturer()));
                               }
                                 )
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
