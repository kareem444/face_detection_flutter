import 'package:face_recongantion/v1/modules/create_new_session/new_session.dart';
import 'package:face_recongantion/v1/modules/forgertpassword/forgert_password.dart';
import 'package:face_recongantion/v1/modules/instructions/instructions_screen.dart';
import 'package:face_recongantion/v1/modules/registerlecturer/register_lecturer.dart';
import 'package:face_recongantion/v1/modules/registerstudent/register_student.dart';
import 'package:face_recongantion/v1/shared/components/components/components.dart';
import 'package:face_recongantion/v2/helper/feedback_widgets_helper.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginLecturer extends StatefulWidget {
  const LoginLecturer({Key? key}) : super(key: key);

  @override
  State<LoginLecturer> createState() => _LoginLecturerState();
}

class _LoginLecturerState extends State<LoginLecturer> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  String? emailAddress;
  String? codeUninversity;
  final _auth = FirebaseAuth.instance;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/woman-with-phone-doing-face-scan.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 108, 111)
                        .withOpacity(0.5),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Center(
                        child: Text(
                          "Attend",
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w200,
                              color: Color(0xFFFFFFFF),
                              fontFamily: "Kansan Script"),
                        ),
                      ),
                      const Spacer(
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                defualtText(text: "Email"),
                                const Spacer(
                                  flex: 1,
                                ),
                                defualtFormField(
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return ("please enter your email");
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9>-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("please ente a valid email");
                                    }
                                    return null;
                                  },
                                  hintText: "Email",
                                  icon: Icons.email_sharp,
                                  control: emailController,
                                  type: TextInputType.emailAddress,
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                defualtText(text: "Password"),
                                const Spacer(
                                  flex: 1,
                                ),
                                defualtFormField(
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return ("pleas enter the code of university");
                                      }
                                      if (value.length <= 5) {
                                        return ("please enter a valid code");
                                      }
                                      return null;
                                    },
                                    hintText: "Password",
                                    icon: Icons.lock,
                                    type: TextInputType.number,
                                    icontwo: isPassword
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off,
                                    control: passwordController,
                                    ispassword: isPassword,
                                    function: () {
                                      setState(() {
                                        isPassword = !isPassword;
                                      });
                                    }),
                                const Spacer(
                                  flex: 2,
                                ),
                                defualtTextButton(
                                    textbutton: "Forget Password",
                                    function: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgertPassword()));
                                    }),
                                const Spacer(
                                  flex: 2,
                                ),
                                defualtButton(
                                    text: "Login",
                                    function: () async {
                                      if (formKey.currentState!.validate()) {
                                        isloading = true;
                                        setState(() {});
                                        try {
                                          await singIN();
                                        } on FirebaseAuthException catch (ex) {
                                          if (ex.code == 'user_not_found') {
                                            // الحاجة اللى هتحصل اللى هى ال dialog
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/warning.png",
                                                          color: const Color(
                                                              0xFFFFC444),
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        const Text(
                                                            "Ops! Something Went\n             Wrong",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                      ],
                                                    ),
                                                    content: SizedBox(
                                                      // width:MediaQuery.of(context).size.width*0.95,
                                                      width: 250,
                                                      height: 160,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                                "         please enter the correct \n e-mail & university code and try \n                      again. ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                            .grey[
                                                                        700])),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            defualtButtonDialog(
                                                                text: "Ok",
                                                                function: () {},
                                                                dialogColor:
                                                                    const Color(
                                                                        0xFFFECC5F)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } else if (ex.code ==
                                              'wrong_password') {
                                            // الحاجة اللى هتصل هى كمان اللى هى  ال dialog
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/warning.png",
                                                          color: const Color(
                                                              0xFFFFC444),
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        const Text(
                                                            "Ops! Something Went\n             Wrong",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                      ],
                                                    ),
                                                    content: SizedBox(
                                                      // width:MediaQuery.of(context).size.width*0.95,
                                                      width: 400,
                                                      height: 250,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            const Text(
                                                              "Here is some instructions to put in mind:",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: const [
                                                                    Text(".",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                35,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    Text(
                                                                      "Enter your full name in the username       \n "
                                                                      "field, no numbers or special  characters.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  //     mainAxisAlignment: MainAxisAlignment.center,

                                                                  children: const [
                                                                    Text(".",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                35,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    Text(
                                                                      "Make Sure to enter valid email address.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  //     mainAxisAlignment: MainAxisAlignment.center,

                                                                  children: const [
                                                                    Text(".",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                35,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    Text(
                                                                      "Make Sure to enter your university code\n correctly.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                defualtButton(
                                                                    text: "ok",
                                                                    function:
                                                                        () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => const RigisterStudent()));
                                                                    })
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        } catch (ex) {
                                          print(ex);
                                        }
                                      }
                                      isloading = false;
                                      setState(() {});
                                    }),
                                const Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Don't have account?",
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        )),
                                    defualtTextButton(
                                        textbutton: "Register",
                                        function: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterLecturer()));
                                        })
                                  ],
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
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
      ),
    );
  }

  Future<void> singIN() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      UserService.updateLocation(context);
      UserService.getCurrentuser(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateNewSession()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "No user found for that email.",
          color: Colors.red,
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "Wrong password provided for that user.",
          color: Colors.red,
        );
        print('Wrong password provided for that user.');
      }
    }
  }
}

// import 'package:face_recongantion/v1/modules/forgertpassword/forgert_password.dart';
// import 'package:face_recongantion/v1/modules/registerlecturer/register_lecturer.dart';
// import 'package:face_recongantion/v1/shared/components/components/components.dart';
// import 'package:flutter/material.dart';

// class LoginLecturer extends StatefulWidget {
//   const LoginLecturer({Key? key}) : super(key: key);

//   @override
//   State<LoginLecturer> createState() => _LoginLecturerState();
// }

// class _LoginLecturerState extends State<LoginLecturer> {
//   bool _forgetPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
//             child: Stack(
//               children: [
//                 Image.asset(
//                   "assets/images/woman-with-phone-doing-face-scan.png",
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 1,
//                   fit: BoxFit.cover,
//                 ),
//                 Container(
//                   color: Color.fromARGB(255, 10, 108, 111).withOpacity(0.5),
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 1,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 15,
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 35,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                     Spacer(
//                       flex: 1,
//                     ),
//                     Center(
//                       child: Text(
//                         "Atendy",
//                         style: TextStyle(
//                             fontSize: 55,
//                             fontWeight: FontWeight.w200,
//                             color: Color(0xFFFFFFFF),
//                             fontFamily: "Kaushan Script"),
//                       ),
//                     ),
//                     Spacer(
//                       flex: 4,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(40),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Spacer(
//                               flex: 1,
//                             ),
//                             defualtText(text: "Email"),
//                             Spacer(
//                               flex: 1,
//                             ),
//                             Container(
//                               height: 50,
//                               child: Material(
//                                 elevation: 12,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: "Email",
//                                     hintStyle: TextStyle(fontSize: 18),
//                                     labelStyle: TextStyle(
//                                         color: Colors.grey, fontSize: 10),
//                                     prefixIcon: Icon(Icons.email),
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     border: OutlineInputBorder(),
//                                     // enabledBorder: InputBorder.none,
//                                   ),
//                                   keyboardType: TextInputType.emailAddress,
//                                 ),
//                               ),
//                             ),
//                             Spacer(
//                               flex: 1,
//                             ),
//                             defualtText(text: "Password"),
//                             Spacer(
//                               flex: 1,
//                             ),
//                             Container(
//                               height: 50,
//                               child: Material(
//                                 elevation: 10,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: "Password",
//                                     hintStyle: TextStyle(fontSize: 18),
//                                     labelStyle: TextStyle(
//                                         color: Colors.grey, fontSize: 10),
//                                     prefixIcon: Icon(Icons.lock),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _forgetPassword
//                                             ? Icons.visibility_off
//                                             : Icons
//                                                 .visibility, //change icon based on boolean value
//                                         color:
//                                             Theme.of(context).primaryColorDark,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _forgetPassword =
//                                               !_forgetPassword; //change boolean value
//                                         });
//                                       },
//                                     ),
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     border: OutlineInputBorder(),
//                                     // enabledBorder: InputBorder.none,
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   obscureText: _forgetPassword,
//                                 ),
//                               ),
//                             ),
//                             defualtTextButton(
//                                 textbutton: "Forget Password",
//                                 function: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ForgertPassword()));
//                                 }),
//                             Spacer(
//                               flex: 2,
//                             ),
//                             defualtButton(text: "Login", function: () {}),
//                             Spacer(
//                               flex: 1,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Don't have account?",
//                                       style: TextStyle(
//                                           fontSize: 17, color: Colors.grey),
//                                     )),
//                                 defualtTextButton(
//                                     textbutton: "Register",
//                                     function: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   RegisterLecturer()));
//                                     })
//                               ],
//                             ),
//                             Spacer(
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
